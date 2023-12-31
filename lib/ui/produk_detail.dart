import 'package:crud_toko/bloc/produk_bloc.dart';
import 'package:crud_toko/ui/produk_page.dart';
import 'package:flutter/material.dart';
import 'package:crud_toko/model/produk.dart';
import 'package:crud_toko/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  const ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () async {
            try {
              await ProdukBloc.deleteProduk(id: widget.produk?.id);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const ProdukPage()));
            } catch (e) {
              print(e);
            }
          },
        ),
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Kode : ${widget.produk!.kodeProduk}", style: const TextStyle(fontSize: 20.0)),
            Text("Nama : ${widget.produk!.namaProduk}", style: const TextStyle(fontSize: 18.0)),
            Text("Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
                style: const TextStyle(fontSize: 18.0)),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
            child: const Text("EDIT"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProdukForm(
                            produk: widget.produk!,
                          )));
            }),
        OutlinedButton(child: const Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }
}
