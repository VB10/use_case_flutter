// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../code_gen/user/user.dart';
import '../local_search/model/reply.dart';

class SpecialSearchView extends StatefulWidget {
  const SpecialSearchView({super.key});
  @override
  State<SpecialSearchView> createState() => _SpecialSearchViewState();
}

class _SpecialSearchViewState extends State<SpecialSearchView> {
  late final SearchUserReply searchUserReply;
  List<User> _searchedUsers = [];
  List<Reply> _searchedReplies = [];

  final _listOneTitle = 'User List';

  ValueNotifier<List<User>> _userNotifierList = ValueNotifier([]);
  @override
  void initState() {
    super.initState();
    searchUserReply =
        SearchUserReply(users: User.users, replies: Reply.replies);
    _userNotifierList = ValueNotifier(searchUserReply.users);
    _searchListUpdate(searchUserReply);
  }

  void _searchListUpdate(SearchUserReply searchUserReply) {
    _userNotifierList.value = searchUserReply.users;
    // Setstate versiyonu
    _searchedUsers = searchUserReply.users;
    _searchedReplies = searchUserReply.replies;
  }

  void _searchKey(String key) {
    final newSearch = searchUserReply.find(key);
    setState(() {
      _searchListUpdate(newSearch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          TextField(
            onChanged: _searchKey,
          ).toSliver,
          _ValueUserTitle(
            userNotifierList: _userNotifierList,
          ),
          _ValueUserList(userNotifierList: _userNotifierList),
          Text(
            _listOneTitle,
            style: context.general.textTheme.bodyLarge,
          ).ext.toVisible(value: _searchedReplies.isNotEmpty).toSliver,
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  child: Text(_searchedReplies[index].result ?? ''),
                );
              },
              childCount: _searchedReplies.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _ValueUserTitle extends StatelessWidget {
  const _ValueUserTitle({
    required ValueNotifier<List<User>> userNotifierList,
  }) : _userNotifierList = userNotifierList;

  final ValueNotifier<List<User>> _userNotifierList;
  final _listSecondTitle = 'Reply List';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<User>>(
      valueListenable: _userNotifierList,
      builder: (BuildContext context, List<User> value, Widget? child) {
        return Text(
          _listSecondTitle,
          style: context.general.textTheme.displaySmall,
        ).ext.toVisible(value: value.isNotEmpty).toSliver;
      },
    );
  }
}

class _ValueUserList extends StatelessWidget {
  const _ValueUserList({
    required ValueNotifier<List<User>> userNotifierList,
  }) : _userNotifierList = userNotifierList;

  final ValueNotifier<List<User>> _userNotifierList;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<User>>(
      valueListenable: _userNotifierList,
      builder: (BuildContext context, List<User> value, Widget? child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                child: Text(value[index].name ?? ''),
              );
            },
            childCount: value.length,
          ),
        );
      },
    );
  }
}

extension WidgetExtension2 on Widget {
  Widget get toSliver => SliverToBoxAdapter(
        child: this,
      );
}

class SearchUserReply {
  SearchUserReply({required this.users, required this.replies});

  final List<User> users;
  final List<Reply> replies;

  SearchUserReply find(String key) {
    // compute
    // debounce
    final items =
        users.where((element) => element.name?.contains(key) ?? false).toList();

    final itemSearchedReply = replies
        .where((element) => element.result?.contains(key) ?? false)
        .toList();

    return SearchUserReply(users: items, replies: itemSearchedReply);
  }
}
