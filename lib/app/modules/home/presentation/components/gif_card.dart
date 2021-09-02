import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/gifs_controller.dart';

class GifCard extends StatefulWidget {
  final String gifUrl;

  GifCard({Key? key, required this.gifUrl}) : super(key: key);

  @override
  _GifCardState createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  final GifsController controller = Modular.get();
  OverlayEntry? _entry;

  Future<void> show() async {
    if (_entry == null) {
      _entry = gifOverlay();
    }
    asuka.addOverlay(_entry!);
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> hide() async {
    if (_entry != null) {
      _entry!.remove();
      _entry = null;
    }
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(8);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        onTap: () async => await show(),
        child: _image(context, borderRadius)
      ),
    );
  }

  Widget _image(BuildContext context, BorderRadius borderRadius) 
    => ClipRRect(
    borderRadius: borderRadius,
    child: FadeInImage.assetNetwork(
      placeholder: "assets/img/placeholder.png", 
      image: widget.gifUrl,
      fit: BoxFit.fill,
    )
  );

  OverlayEntry gifOverlay() => OverlayEntry(
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.6),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(),
            Center(child: Image.network(widget.gifUrl)),
            ElevatedButton(
              onPressed: () async => await hide(), 
              child: Text("Fechar")
            )
          ],
        ),
      );
    },
  );
}