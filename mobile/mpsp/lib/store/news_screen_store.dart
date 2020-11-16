import 'package:mobx/mobx.dart';
import 'package:mpsp/models/news_model.dart';
import 'package:mpsp/models/usuario_model.dart';
import 'package:mpsp/service/news_service.dart';
part 'news_screen_store.g.dart';

class NewsScreenStore = _NewsScreenStore with _$NewsScreenStore;

abstract class _NewsScreenStore with Store {
  final NewsService _newsService = NewsService();
  List<NewsModel> _listaNewsLocal = <NewsModel>[];

  _NewsScreenStore() {
    init();
  }

  void init() async {
    isLoading = true;
    _listaNewsLocal = await _newsService.findAll();
    listaNews = _listaNewsLocal.asObservable();
    isLoading = false;
  }

  @observable
  UsuarioModel user;

  @observable
  String filtro = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<NewsModel> listaNews = <NewsModel>[].asObservable();

  @action
  findAllNews() async {
    init();
  }

  @action
  setFiltro(value) {
    filtro = value;
  }

  @computed
  List<NewsModel> get filtered {
    if (filtro.isEmpty) {
      return listaNews.toList();
    } else {
      var lista = listaNews
          .where(
            (c) => c.titulo.toLowerCase().contains(
                  filtro.toLowerCase(),
                ),
          )
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaNews.length;
  }

  @action
  alterarValor() {
    this.user = UsuarioModel.usuarioModel;
  }
}
