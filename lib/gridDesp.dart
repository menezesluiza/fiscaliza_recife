// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiscaliza_recife/chartDespFunc.dart';
import 'package:fiscaliza_recife/chartDespMensal.dart';
import 'package:fiscaliza_recife/chartDespMod.dart';
import 'package:fiscaliza_recife/funcoes.dart';
import 'package:fiscaliza_recife/semDesp.dart';
import 'package:flutter/material.dart';

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
      return orgaosD2018;
    } else if (ano == '2017') {
      return orgaosD2017;
    } else if (ano == '2016') {
      return orgaosD2016;
    } else if (ano == '2015') {
      return orgaosD2015;
    } else
      return null;
  }

  String _returncod(String value, String ano) {
    Map _lista = _returnOrgaoList(ano);
    var _key =
        _lista.keys.firstWhere((k) => _lista[k] == value, orElse: () => null);
    return _key;
  }

  _semDespesa(double desp) {
    if (desp > 0) {
      return true;
    } else
      return false;
  }

  _getData() async {
    await FirebaseFirestore.instance
        .collection('totais_despesas')
        .where('ano_mov', isEqualTo: dropdownValueD)
        .where('orgao_codigo', isEqualTo: orgaoCod)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        isZero(doc['desp'])
            ? desp = 0
            : desp = double.parse(doc['desp'].toString());
        isZero(doc['despjan'])
            ? despJan = 0
            : despJan = double.parse(doc['despjan'].toString());
        isZero(doc['despfev'])
            ? despFev = 0
            : despFev = double.parse(doc['despfev'].toString());
        isZero(doc['despmar'])
            ? despMar = 0
            : despMar = double.parse(doc['despmar'].toString());
        isZero(doc['despabr'])
            ? despAbr = 0
            : despAbr = double.parse(doc['despabr'].toString());
        isZero(doc['despmai'])
            ? despMai = 0
            : despMai = double.parse(doc['despmai'].toString());
        isZero(doc['despjun'])
            ? despJun = 0
            : despJun = double.parse(doc['despjun'].toString());
        isZero(doc['despjul'])
            ? despJul = 0
            : despJul = double.parse(doc['despjul'].toString());
        isZero(doc['despago'])
            ? despAgo = 0
            : despAgo = double.parse(doc['despago'].toString());
        isZero(doc['despset'])
            ? despSet = 0
            : despSet = double.parse(doc['despset'].toString());
        isZero(doc['despout'])
            ? despOut = 0
            : despOut = double.parse(doc['despout'].toString());
        isZero(doc['despnov'])
            ? despNov = 0
            : despNov = double.parse(doc['despnov'].toString());
        isZero(doc['despdez'])
            ? despDez = 0
            : despDez = double.parse(doc['despdez'].toString());
        isZero(doc['adminis'])
            ? adminis = 0
            : adminis = double.parse(doc['adminis'].toString());
        isZero(doc['asssocial'])
            ? assSocial = 0
            : assSocial = double.parse(doc['asssocial'].toString());
        isZero(doc['cietec'])
            ? cieTec = 0
            : cieTec = double.parse(doc['cietec'].toString());
        isZero(doc['comserv'])
            ? comServ = 0
            : comServ = double.parse(doc['comserv'].toString());
        isZero(doc['cultura'])
            ? cultura = 0
            : cultura = double.parse(doc['cultura'].toString());
        isZero(doc['desporlaz'])
            ? desporLaz = 0
            : desporLaz = double.parse(doc['desporlaz'].toString());
        isZero(doc['educ'])
            ? educ = 0
            : educ = double.parse(doc['educ'].toString());
        isZero(doc['encarg'])
            ? encarg = 0
            : encarg = double.parse(doc['encarg'].toString());
        isZero(doc['essjustica'])
            ? essJustica = 0
            : essJustica = double.parse(doc['essjustica'].toString());
        isZero(doc['gestamb'])
            ? gestAmb = 0
            : gestAmb = double.parse(doc['gestamb'].toString());
        isZero(doc['habit'])
            ? habit = 0
            : habit = double.parse(doc['habit'].toString());
        isZero(doc['prevsocial'])
            ? prevSocial = 0
            : prevSocial = double.parse(doc['prevsocial'].toString());
        isZero(doc['sane'])
            ? sane = 0
            : sane = double.parse(doc['sane'].toString());
        isZero(doc['saude'])
            ? saude = 0
            : saude = double.parse(doc['saude'].toString());
        isZero(doc['segpub'])
            ? segPub = 0
            : segPub = double.parse(doc['segpub'].toString());
        isZero(doc['trab'])
            ? trab = 0
            : trab = double.parse(doc['trab'].toString());
        isZero(doc['urbanismo'])
            ? urbanismo = 0
            : urbanismo = double.parse(doc['urbanismo'].toString());
        isZero(doc['dircid'])
            ? dirCid = 0
            : dirCid = double.parse(doc['dircid'].toString());
        isZero(doc['naoinfo'])
            ? naoInfo = 0
            : naoInfo = double.parse(doc['naoinfo'].toString());
        isZero(doc['dispensa'])
            ? dispensa = 0
            : dispensa = double.parse(doc['dispensa'].toString());
        isZero(doc['selecaopub'])
            ? selecaoPub = 0
            : selecaoPub = double.parse(doc['selecaopub'].toString());
        isZero(doc['concurso'])
            ? concurso = 0
            : concurso = double.parse(doc['concurso'].toString());
        isZero(doc['pregregprec'])
            ? pregRegPrec = 0
            : pregRegPrec = double.parse(doc['pregregprec'].toString());
        isZero(doc['concregprec'])
            ? concRegPrec = 0
            : concRegPrec = double.parse(doc['concregprec'].toString());
        isZero(doc['pregelet'])
            ? pregElet = 0
            : pregElet = double.parse(doc['pregelet'].toString());
        isZero(doc['inexig'])
            ? inexig = 0
            : inexig = double.parse(doc['inexig'].toString());
        isZero(doc['credenc'])
            ? credenc = 0
            : credenc = double.parse(doc['credenc'].toString());
        isZero(doc['pregao'])
            ? pregao = 0
            : pregao = double.parse(doc['pregao'].toString());
        isZero(doc['convite'])
            ? convite = 0
            : convite = double.parse(doc['convite'].toString());
        isZero(doc['convenio'])
            ? convenio = 0
            : convenio = double.parse(doc['convenio'].toString());
        isZero(doc['concorrencia'])
            ? concorrencia = 0
            : concorrencia = double.parse(doc['concorrencia'].toString());
        isZero(doc['tomadapreco'])
            ? tomadaPreco = 0
            : tomadaPreco = double.parse(doc['tomadapreco'].toString());
      });
    });
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
