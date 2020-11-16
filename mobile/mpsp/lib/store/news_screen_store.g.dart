// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsScreenStore on _NewsScreenStore, Store {
  Computed<List<NewsModel>> _$filteredComputed;

  @override
  List<NewsModel> get filtered =>
      (_$filteredComputed ??= Computed<List<NewsModel>>(() => super.filtered,
              name: '_NewsScreenStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade =>
      (_$quantidadeComputed ??= Computed<int>(() => super.quantidade,
              name: '_NewsScreenStore.quantidade'))
          .value;

  final _$userAtom = Atom(name: '_NewsScreenStore.user');

  @override
  UsuarioModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UsuarioModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$filtroAtom = Atom(name: '_NewsScreenStore.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewsScreenStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listaNewsAtom = Atom(name: '_NewsScreenStore.listaNews');

  @override
  ObservableList<NewsModel> get listaNews {
    _$listaNewsAtom.reportRead();
    return super.listaNews;
  }

  @override
  set listaNews(ObservableList<NewsModel> value) {
    _$listaNewsAtom.reportWrite(value, super.listaNews, () {
      super.listaNews = value;
    });
  }

  final _$findAllNewsAsyncAction = AsyncAction('_NewsScreenStore.findAllNews');

  @override
  Future findAllNews() {
    return _$findAllNewsAsyncAction.run(() => super.findAllNews());
  }

  final _$_NewsScreenStoreActionController =
      ActionController(name: '_NewsScreenStore');

  @override
  dynamic setFiltro(dynamic value) {
    final _$actionInfo = _$_NewsScreenStoreActionController.startAction(
        name: '_NewsScreenStore.setFiltro');
    try {
      return super.setFiltro(value);
    } finally {
      _$_NewsScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic alterarValor() {
    final _$actionInfo = _$_NewsScreenStoreActionController.startAction(
        name: '_NewsScreenStore.alterarValor');
    try {
      return super.alterarValor();
    } finally {
      _$_NewsScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
filtro: ${filtro},
isLoading: ${isLoading},
listaNews: ${listaNews},
filtered: ${filtered},
quantidade: ${quantidade}
    ''';
  }
}
