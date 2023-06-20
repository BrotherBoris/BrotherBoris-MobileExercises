import 'package:flutter/material.dart';
import 'package:crud_api/back/controllers/game_controller.dart';
import 'package:crud_api/back/models/game.dart';
import 'package:crud_api/back/validators/validator_form.dart';
import 'package:crud_api/front/components/basic_button.dart';
import 'package:crud_api/front/components/Basic_text_fields.dart';

class GameFormScreen extends StatefulWidget {
  GameController gameController = GameController();
  Game? editableGame;

  GameFormScreen({super.key, this.editableGame});

  @override
  State<GameFormScreen> createState() => _GameFormScreen();
}

class _GameFormScreen extends State<GameFormScreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editableGame != null) {
      widget.gameController.setGame(widget.editableGame);
    }
    if (widget.gameController.game != null) {
      _idController.text = widget.gameController.game!.id.toString();
      _titleController.text = widget.gameController.game!.title!;
      _priceController.text = widget.gameController.game!.price.toString();
      _publisherController.text = widget.gameController.game!.publisher!;
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _titleController.dispose();
    _priceController.dispose();
    _publisherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gameController.game == null ? 'New Game' : 'Edit Game'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(children: <Widget>[
            const SizedBox(height: 10),
            BasicTextFieldForm(
              fieldLabel: "Title",
              controller: _titleController,
              validators: [ValidatorForm.validateEmpty()],
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            NumberTextFieldForm(
              fieldLabel: "Price",
              controller: _priceController,
              validators: [ValidatorForm.validateEmpty(), ValidatorForm.validateNumberNonNegative()],
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            BasicTextFieldForm(
              fieldLabel: "Publisher",
              controller: _publisherController,
              validators: [ValidatorForm.validateEmpty()],
              onSaved: (value) {},
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VisibleButton(
                      isVisible: widget.gameController.game == null,
                      buttonText: "Create",
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          widget.gameController
                              .create(Game(title: _titleController.text, price: double.parse(_priceController.text), publisher: _publisherController.text));
                          Navigator.pop(context);
                        }
                      }),
                  VisibleButton(
                      isVisible: widget.gameController.game != null,
                      buttonText: "Update",
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          widget.gameController.setGame(Game(
                            id: _idController.text,
                            title: _titleController.text,
                            price: double.parse(_priceController.text),
                            publisher: _publisherController.text,
                          ));
                          widget.gameController.update(widget.gameController.game!);
                          Navigator.pop(context);
                        }
                      }),
                  const SizedBox(width: 10),
                  VisibleButton(
                      isVisible: widget.gameController.game == null,
                      buttonText: "Clear",
                      onPressed: () {
                        _titleController.text = "";
                        _priceController.text = "";
                        _publisherController.text = "";
                      }),
                  const SizedBox(width: 10),
                  BasicButton(
                      buttonText: "Return",
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
