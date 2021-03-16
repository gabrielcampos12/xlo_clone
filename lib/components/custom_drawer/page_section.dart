import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo/components/custom_drawer/page_tile.dart';
import 'package:xlo/stores/page_store.dart';
class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncio',
          iconData: Icons.list,
          onTap: (){
            pageStore.setPage(0);
          },
          highlighted: true,
        ),
        PageTile(
          label: 'Inserir anúncio',
          iconData: Icons.edit,
          onTap:(){
            pageStore.setPage(1);
          },
          highlighted: false,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: (){
            pageStore.setPage(2);
        },
          highlighted: false,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: (){
            pageStore.setPage(3);
        },
          highlighted: false,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: (){
            pageStore.setPage(4);
        },
          highlighted: false,
        ),
      ],
    );
  }
}
