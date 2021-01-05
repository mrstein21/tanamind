import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanamind/cubit/marketplace/category/category_item/category_item_cubit.dart';
import 'package:tanamind/global.dart';
import 'package:tanamind/helper/shared_preferences.dart';
import 'package:tanamind/ui/marketplace/category/category_screen.dart';
import 'package:tanamind/ui/widget/widget_helper.dart';

abstract class CategoryViewModel extends State<CategoryScreen> {
  int radioFilter;
  int radioSort;
  var filter;
  var sort;
  CategoryItemCubit cubit;

  var listCategories = [];

  filterCategories(String value1, String value2) {
    if (value1 != null) {
      if (value1 == 'is_promo') {
        listCategories.add('Promo');
      } else if (value1 == 'is_bestseller') {
        listCategories.add('Best Seller');
      }
    }
    if (value2 != null) {
      if (value2 == 'asc') {
        listCategories.add('Min Prices');
      } else if (value2 == 'desc') {
        listCategories.add('Max Prices');
      }
    }
  }

  onTapButton({var filter, var sort, String id, int page}) async {
    var filterValue = [];
    var sortValue = ['created_at'];
    if (filter == null) {
      filterValue.add('is_promo');
    } else {
      filterValue.add(filter);
    }
    if (sort == null) {
      sortValue.add('asc');
    } else {
      sortValue.add(sort);
    }

    print('$filterValue\n$sortValue');

    cubit.onFilterItem(
        id: id, page: page, sort: sortValue, filter: filterValue);
  }

  onSearchItem({var filter, var sort, String id, var key, int page}) {
    var filterValue = [];
    var sortValue = [];
    if (filter != null) {
      filterValue.add(filter);
    }
    if (sort != null) {
      sortValue.add('created_at');
      sortValue.add(sort);
    }
    print('$key');

    cubit.onSearchItem(
        id: id, page: page, filter: filterValue, sort: sortValue, key: key);
  }

  Future onFavPageIcon() async {
    if (tokenGlobal != null) {
      Navigator.pushNamed(context, '/favourite');
    } else {
      flushBar(context, 'Anda harus login terlebih dahulu');
    }
  }

  Future<void> getFavLength() async {
    favLength = await UserPreferences.getUserFav();
  }

  var listAlat = [
    {
      'title': 'Lorem ipsum dolor sit amet',
      'rate': 3.0,
      'price': 'Rp. 80.000',
      'rating': '400',
      'image': 'assets/alat/alat_1.jpg'
    },
    {
      'title':
          'consectetur adipiscing elit. Vivamus finibus in elit at iaculis',
      'rate': 2.5,
      'price': 'Rp. 120.000',
      'rating': '275',
      'image': 'assets/alat/alat_2.jpg'
    },
    {
      'title': 'Donec sapien justo, pulvinar at mi id',
      'rate': 2.0,
      'price': 'Rp. 45.000',
      'rating': '669',
      'image': 'assets/alat/alat_3.jpg'
    },
    {
      'title':
          'Maecenas blandit leo eu diam rutrum, quis lacinia risus convallis. Nunc mattis a magna nec sagittis',
      'rate': 3.5,
      'price': 'Rp. 110.000',
      'rating': '129',
      'image': 'assets/alat/alat_4.jpg'
    },
    {
      'title': 'Maecenas posuere nisl tellus, sed pulvinar nisl commodo in',
      'rate': 4.0,
      'price': 'Rp. 225.000',
      'rating': '395',
      'image': 'assets/alat/alat_5.jpg'
    },
    {
      'title':
          'rutrum consectetur nulla Quisque sodales nisl quam, ac ornare nisl interdum vel',
      'rate': 3.0,
      'price': 'Rp. 36.000',
      'rating': '1025',
      'image': 'assets/alat/alat_6.jpg'
    },
  ];
}
