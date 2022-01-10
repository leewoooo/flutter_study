import 'package:flutter/material.dart';
import 'package:instagram_without_ref/domain/article.dart';
import 'package:instagram_without_ref/dto/article.dart';
import 'package:instagram_without_ref/store/home.dart';
import 'package:provider/provider.dart';

class ArticleRegister extends StatelessWidget {
  ArticleRegister({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderingAppBar(context,formKey),
      body: _renderingBody(context,formKey),
    );
  }

  Container _renderingBody(BuildContext context, GlobalKey<FormState> formKey){
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '업로드 될 Image',
            style: TextStyle(
              fontWeight: FontWeight.w700
            ),
          ),
          Image.file(
            context.watch<HomeStore>().file,
            height: 300.0,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                _rederingTextFormField(
                    label: 'User',
                    onSaved: (newValue) {
                      context.read<HomeStore>().setUser(newValue.toString());
                    },
                    validator: (value) {
                      if(value.toString().isEmpty){
                        return '작성자를 입력해주세요.';
                      }
                      return null;
                    },
                ),
                _rederingTextFormField(
                    label: 'Content',
                    onSaved: (newValue) {
                      context.read<HomeStore>().setContent(newValue.toString());
                    },
                    validator: (value) {
                      if(value.toString().isEmpty){
                        return '내용을 입력해주세요.';
                      }
                      return null;
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _rederingTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }){
    return Column(
      children: <Widget>[
        const SizedBox(height: 15.0),
        Row(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  AppBar _renderingAppBar(BuildContext context,GlobalKey<FormState> formkey){
    return AppBar(
      title: const Text('새 게시글'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.assignment_turned_in_outlined),
          onPressed: () {
            if(formKey.currentState!.validate()){
              formKey.currentState!.save();
              SaveArticleRequest req = SaveArticleRequest(
                  // https://stackoverflow.com/questions/66896277/tried-to-listen-to-a-value-exposed-with-provider-from-outside-of-the-widget-tre
                  id: Provider.of<HomeStore>(context,listen: false).articles.length,
                  file: Provider.of<HomeStore>(context,listen: false).file,
                  date: DateTime.now().toString(),
                  content: Provider.of<HomeStore>(context,listen: false).content,
                  user: Provider.of<HomeStore>(context,listen: false).user
              );

              context.read<HomeStore>().addArticleWhereFrist(Article.fromSaveRequest(req));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
