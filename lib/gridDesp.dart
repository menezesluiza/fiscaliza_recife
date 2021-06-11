// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscaliza_recife/chartDespFunc.dart';
import 'package:fiscaliza_recife/chartDespMensal.dart';
import 'package:fiscaliza_recife/chartDespMod.dart';
import 'package:fiscaliza_recife/semDesp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class GridDesp extends StatefulWidget {
  const GridDesp({
    Key key,
  }) : super(key: key);

  @override
  _GridDespState createState() => _GridDespState();
}

class _GridDespState extends State<GridDesp> {
  void initState() {
    super.initState();
    _loadOrgaosD();
    _getData();
  }

  String dropdownValueD = '2021';
  List<String> anosD = ['2021', '2020', '2019', '2018', '2017', '2016', '2015'];

  String orgaoD = 'TODOS OS ÓRGÃOS';

  Map<String, String> orgaosD2021 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2020 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2019 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2018 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2017 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2016 = {'0': 'TODOS OS ÓRGÃOS'};
  Map<String, String> orgaosD2015 = {'0': 'TODOS OS ÓRGÃOS'};
  String orgaoCod = '0';

  double desp = 0;
  double despJan = 0;
  double despFev = 0;
  double despMar = 0;
  double despAbr = 0;
  double despMai = 0;
  double despJun = 0;
  double despJul = 0;
  double despAgo = 0;
  double despSet = 0;
  double despOut = 0;
  double despNov = 0;
  double despDez = 0;
  double adminis = 0;
  double assSocial = 0;
  double cieTec = 0;
  double comServ = 0;
  double cultura = 0;
  double desporLaz = 0;
  double educ = 0;
  double encarg = 0;
  double essJustica = 0;
  double gestAmb = 0;
  double habit = 0;
  double prevSocial = 0;
  double sane = 0;
  double saude = 0;
  double segPub = 0;
  double trab = 0;
  double urbanismo = 0;
  double dirCid = 0;
  double naoInfo = 0;
  double dispensa = 0;
  double selecaoPub = 0;
  double concurso = 0;
  double pregRegPrec = 0;
  double concRegPrec = 0;
  double pregElet = 0;
  double inexig = 0;
  double credenc = 0;
  double pregao = 0;
  double convite = 0;
  double tomadaPreco = 0;
  double concorrencia = 0;
  double convenio = 0;

  TextStyle chartTitle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  BoxDecoration chartDecor =
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black26)));

  void _loadOrgaosD() {
    anosD.forEach((element) {
      FirebaseFirestore.instance
          .collection('orgaos_despesas')
          .where('ano', isEqualTo: element)
          .orderBy('id')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (doc['orgao_codigo'] != '0') {
            _returnOrgaoList(element)
                .addAll({doc['orgao_codigo']: doc['orgao_nome']});
            //print(doc['orgao_nome']);
          }
        });
      });
    });

    setState(() {});
  }

  Map<String, String> _returnOrgaoList(String ano) {
    if (ano == '2021') {
      return orgaosD2021;
    } else if (ano == '2020') {
      return orgaosD2020;
    } else if (ano == '2019') {
      return orgaosD2019;
    } else if (ano == '2018') {
      return orgaosD2019;
    } else if (ano == '2017') {
      return orgaosD2019;
    } else if (ano == '2016') {
      return orgaosD2019;
    } else if (ano == '2015') {
      return orgaosD2019;
    } else
      return null;
  }

  String _returncod(String value, String ano) {
    Map _lista = _returnOrgaoList(ano);
    var _key =
        _lista.keys.firstWhere((k) => _lista[k] == value, orElse: () => null);
    return _key;
  }

  _isZero(var value) {
    if (value == 0 || value == null) {
      return true;
    } else
      return false;
  }

  _semDespesa(double desp) {
    if (desp > 0) {
      return true;
    } else
      return false;
  }

  String getCurrency(value) {
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  _getData() async {
    await FirebaseFirestore.instance
        .collection('totais_despesas')
        .where('ano_mov', isEqualTo: dropdownValueD)
        .where('orgao_codigo', isEqualTo: orgaoCod)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _isZero(doc['desp'])
            ? desp = 0
            : desp = double.parse(doc['desp'].toString());
        _isZero(doc['despjan'])
            ? despJan = 0
            : despJan = double.parse(doc['despjan'].toString());
        _isZero(doc['despfev'])
            ? despFev = 0
            : despFev = double.parse(doc['despfev'].toString());
        _isZero(doc['despmar'])
            ? despMar = 0
            : despMar = double.parse(doc['despmar'].toString());
        _isZero(doc['despabr'])
            ? despAbr = 0
            : despAbr = double.parse(doc['despabr'].toString());
        _isZero(doc['despmai'])
            ? despMai = 0
            : despMai = double.parse(doc['despmai'].toString());
        _isZero(doc['despjun'])
            ? despJun = 0
            : despJun = double.parse(doc['despjun'].toString());
        _isZero(doc['despjul'])
            ? despJul = 0
            : despJul = double.parse(doc['despjul'].toString());
        _isZero(doc['despago'])
            ? despAgo = 0
            : despAgo = double.parse(doc['despago'].toString());
        _isZero(doc['despset'])
            ? despSet = 0
            : despSet = double.parse(doc['despset'].toString());
        _isZero(doc['despout'])
            ? despOut = 0
            : despOut = double.parse(doc['despout'].toString());
        _isZero(doc['despnov'])
            ? despNov = 0
            : despNov = double.parse(doc['despnov'].toString());
        _isZero(doc['despdez'])
            ? despDez = 0
            : despDez = double.parse(doc['despdez'].toString());
        _isZero(doc['adminis'])
            ? adminis = 0
            : adminis = double.parse(doc['adminis'].toString());
        _isZero(doc['asssocial'])
            ? assSocial = 0
            : assSocial = double.parse(doc['asssocial'].toString());
        _isZero(doc['cietec'])
            ? cieTec = 0
            : cieTec = double.parse(doc['cietec'].toString());
        _isZero(doc['comserv'])
            ? comServ = 0
            : comServ = double.parse(doc['comserv'].toString());
        _isZero(doc['cultura'])
            ? cultura = 0
            : cultura = double.parse(doc['cultura'].toString());
        _isZero(doc['desporlaz'])
            ? desporLaz = 0
            : desporLaz = double.parse(doc['desporlaz'].toString());
        _isZero(doc['educ'])
            ? educ = 0
            : educ = double.parse(doc['educ'].toString());
        _isZero(doc['encarg'])
            ? encarg = 0
            : encarg = double.parse(doc['encarg'].toString());
        _isZero(doc['essjustica'])
            ? essJustica = 0
            : essJustica = double.parse(doc['essjustica'].toString());
        _isZero(doc['gestamb'])
            ? gestAmb = 0
            : gestAmb = double.parse(doc['gestamb'].toString());
        _isZero(doc['habit'])
            ? habit = 0
            : habit = double.parse(doc['habit'].toString());
        _isZero(doc['prevsocial'])
            ? prevSocial = 0
            : prevSocial = double.parse(doc['prevsocial'].toString());
        _isZero(doc['sane'])
            ? sane = 0
            : sane = double.parse(doc['sane'].toString());
        _isZero(doc['saude'])
            ? saude = 0
            : saude = double.parse(doc['saude'].toString());
        _isZero(doc['segpub'])
            ? segPub = 0
            : segPub = double.parse(doc['segpub'].toString());
        _isZero(doc['trab'])
            ? trab = 0
            : trab = double.parse(doc['trab'].toString());
        _isZero(doc['urbanismo'])
            ? urbanismo = 0
            : urbanismo = double.parse(doc['urbanismo'].toString());
        _isZero(doc['dircid'])
            ? dirCid = 0
            : dirCid = double.parse(doc['dircid'].toString());
        _isZero(doc['naoinfo'])
            ? naoInfo = 0
            : naoInfo = double.parse(doc['naoinfo'].toString());
        _isZero(doc['dispensa'])
            ? dispensa = 0
            : dispensa = double.parse(doc['dispensa'].toString());
        _isZero(doc['selecaopub'])
            ? selecaoPub = 0
            : selecaoPub = double.parse(doc['selecaopub'].toString());
        _isZero(doc['concurso'])
            ? concurso = 0
            : concurso = double.parse(doc['concurso'].toString());
        _isZero(doc['pregregprec'])
            ? pregRegPrec = 0
            : pregRegPrec = double.parse(doc['pregregprec'].toString());
        _isZero(doc['concregprec'])
            ? concRegPrec = 0
            : concRegPrec = double.parse(doc['concregprec'].toString());
        _isZero(doc['pregelet'])
            ? pregElet = 0
            : pregElet = double.parse(doc['pregelet'].toString());
        _isZero(doc['inexig'])
            ? inexig = 0
            : inexig = double.parse(doc['inexig'].toString());
        _isZero(doc['credenc'])
            ? credenc = 0
            : credenc = double.parse(doc['credenc'].toString());
        _isZero(doc['pregao'])
            ? pregao = 0
            : pregao = double.parse(doc['pregao'].toString());
        _isZero(doc['convite'])
            ? convite = 0
            : convite = double.parse(doc['convite'].toString());
        _isZero(doc['convenio'])
            ? convenio = 0
            : convenio = double.parse(doc['convenio'].toString());
        _isZero(doc['concorrencia'])
            ? concorrencia = 0
            : concorrencia = double.parse(doc['concorrencia'].toString());
        _isZero(doc['tomadapreco'])
            ? tomadaPreco = 0
            : tomadaPreco = double.parse(doc['tomadapreco'].toString());
      });
    });

    //FirebaseFirestore.instance.terminate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                //ANO
                height: 45,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: new BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValueD,
                    elevation: 8,
                    dropdownColor: Colors.grey[300],
                    style: TextStyle(color: Colors.black87),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueD = newValue;
                        orgaoCod = '0';
                        orgaoD = 'TODOS OS ÓRGÃOS';
                        _getData();
                        print(desp);
                      });
                    },
                    items: anosD.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                //ORGAOS
                child: Container(
                  height: 45,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: new BorderRadius.circular(5)),
                  padding: EdgeInsets.fromLTRB(14, 0, 0, 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: orgaoD,
                      elevation: 8,
                      isExpanded: true,
                      dropdownColor: Colors.grey[300],
                      style: TextStyle(color: Colors.black87),
                      onChanged: (String newValue) {
                        setState(() {
                          orgaoD = newValue;
                          orgaoCod = _returncod(newValue, dropdownValueD);
                          _getData();
                        });
                      },
                      items: _returnOrgaoList(dropdownValueD)
                          .values
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 560,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: ListView(padding: EdgeInsets.zero, children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'DESPESA TOTAL NO ANO',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    getCurrency(desp),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'DESPESA TOTAL POR MÊS',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semDespesa(desp)
                    ? ChartDespMensal(
                        despJan: despJan,
                        despFev: despFev,
                        despMar: despMar,
                        despAbr: despAbr,
                        despMai: despMai,
                        despJun: despJun,
                        despJul: despJul,
                        despAgo: despAgo,
                        despSet: despSet,
                        despOut: despOut,
                        despNov: despNov,
                        despDez: despDez,
                      )
                    : SemDesp(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'DESPESA POR FUNÇÃO',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semDespesa(desp)
                    ? ChartDespFuncao(
                        adminis: adminis,
                        assSocial: assSocial,
                        cieTec: cieTec,
                        comServ: comServ,
                        cultura: cultura,
                        desporLaz: desporLaz,
                        educ: educ,
                        encarg: encarg,
                        essJustica: essJustica,
                        gestAmb: gestAmb,
                        habit: habit,
                        prevSocial: prevSocial,
                        sane: sane,
                        saude: saude,
                        segPub: segPub,
                        trab: trab,
                        urbanismo: urbanismo,
                        dirCid: dirCid,
                      )
                    : SemDesp(),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Text(
                    'DESPESA POR MODALIDADE DE LICITAÇÃO',
                    style: chartTitle,
                  ),
                  decoration: chartDecor,
                ),
                _semDespesa(desp)
                    ? ChartDespMod(
                        concRegPrec: concRegPrec,
                        concorrencia: concorrencia,
                        concurso: concurso,
                        convite: convite,
                        convenio: convenio,
                        credenc: credenc,
                        desp: desp,
                        dispensa: dispensa,
                        naoInfo: naoInfo,
                        inexig: inexig,
                        pregElet: pregElet,
                        pregRegPrec: pregRegPrec,
                        pregao: pregao,
                        selecaoPub: selecaoPub,
                        tomadaPreco: tomadaPreco,
                      )
                    : SemDesp(),
              ])),
        ),
      ],
    );
  }
}
