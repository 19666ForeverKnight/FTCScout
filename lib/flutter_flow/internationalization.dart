import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
  }) =>
      [enText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'ebu9jxiy': {
      'en': 'FTC Scout',
      'zh_Hans': 'FTC Scout',
    },
    'q3s6hgqn': {
      'en': 'Events',
      'zh_Hans': '活动',
    },
    'q84bru56': {
      'en': '+ Add',
      'zh_Hans': '+ 添加',
    },
    '8s0b8x80': {
      'en': 'Update Password',
      'zh_Hans': '更新密码',
    },
    '9rpx4ycc': {
      'en': 'Sign Out',
      'zh_Hans': '登出',
    },
    'wkqbvcxn': {
      'en': 'About',
      'zh_Hans': '关于',
    },
    '8cvpn9l4': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // signup
  {
    '11bhcx4e': {
      'en': 'Create an account',
      'zh_Hans': '创建一个帐户',
    },
    'ym9h34yo': {
      'en': 'Create an FTC Scout account!',
      'zh_Hans': '创建 FTC Scout帐户！',
    },
    'ng5csdft': {
      'en': 'Email',
      'zh_Hans': '电子邮件',
    },
    'smjego8g': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'aylcp631': {
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    'm4ncxni6': {
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    'hqg7elvu': {
      'en': 'Already have an account? ',
      'zh_Hans': '已有账户？',
    },
    '4zfguqaq': {
      'en': ' Sign In here',
      'zh_Hans': '在此登录',
    },
    'u9tgsbkw': {
      'en': 'UserName',
      'zh_Hans': '用户名',
    },
    'by8qd0tj': {
      'en': 'Overall',
      'zh_Hans': '全面的',
    },
    'qdsw5xyp': {
      'en': '5',
      'zh_Hans': '5',
    },
    'va0jhbp7': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'zh_Hans': '漂亮的室外球场、坚固的混凝土和适合社区的优质篮球架。',
    },
    '2jyzal20': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // signin
  {
    'z60ejpsy': {
      'en': 'Login',
      'zh_Hans': '登录',
    },
    'hmjb9zjw': {
      'en': 'Login to your FTC Scout account',
      'zh_Hans': '登录您的 FTC Scout 账户',
    },
    '6vcqap1w': {
      'en': 'Email',
      'zh_Hans': '电子邮件',
    },
    '11frehvv': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'w0cfacll': {
      'en': 'Login In',
      'zh_Hans': '登录',
    },
    'r8epvefs': {
      'en': 'Don\'t have an account?',
      'zh_Hans': '沒有帳戶？',
    },
    'aubg9jjq': {
      'en': ' Sign Up here',
      'zh_Hans': '在此注册',
    },
    'dhvobhj1': {
      'en': 'UserName',
      'zh_Hans': '用户名',
    },
    'c3tb6b66': {
      'en': 'Overall',
      'zh_Hans': '全面的',
    },
    'g9lxv5hk': {
      'en': '5',
      'zh_Hans': '5',
    },
    '40ac0tj1': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'zh_Hans': '漂亮的室外球场、坚固的混凝土和适合社区的优质篮球架。',
    },
    'ktp9mdk9': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // addevent
  {
    '28zbaldl': {
      'en': 'Add Event',
      'zh_Hans': '添加赛事',
    },
    'fmckl3mq': {
      'en': 'Event Name',
      'zh_Hans': '赛事名称',
    },
    'l21mqf98': {
      'en': 'e.g. Shanghai #3 Qualifier',
      'zh_Hans': '例如上海 #3 资格赛',
    },
    '7mxpj7po': {
      'en': 'Event Code',
      'zh_Hans': '赛事代码',
    },
    'ypsecklw': {
      'en': '* Fill in this correctly for auto data pulling',
      'zh_Hans': '* 正确填写此项以便自动提取数据',
    },
    'i0a54bip': {
      'en': 'e.g. CNSHQ3',
      'zh_Hans': '例如 CNSHQ3',
    },
    '4o7fjd76': {
      'en': 'Date',
      'zh_Hans': '日期',
    },
    'u439sgkp': {
      'en': 'Add',
      'zh_Hans': '添加',
    },
    '6kb59j07': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // addmatchscout
  {
    'tc9wnamz': {
      'en': 'Add Match Record',
      'zh_Hans': '添加比赛记录',
    },
    'oy3k05d7': {
      'en': 'Match number#',
      'zh_Hans': '比赛号码#',
    },
    'afx6kg0z': {
      'en': 'e.g. 6',
      'zh_Hans': '例如 6',
    },
    'd2x221rq': {
      'en': 'Team number#',
      'zh_Hans': '队号#',
    },
    'vy6blzad': {
      'en': 'e.g. 19666',
      'zh_Hans': '例如 19666',
    },
    'p0d5xait': {
      'en': 'Match Type',
      'zh_Hans': '比赛类型',
    },
    'dtj9ek60': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'lsm9gm19': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'txower0i': {
      'en': 'Qualifications',
      'zh_Hans': '资格赛',
    },
    'k5jqcdkv': {
      'en': 'Playoffs',
      'zh_Hans': '淘汰赛',
    },
    't8lask9j': {
      'en': 'Practice',
      'zh_Hans': '练习赛',
    },
    'iel2gww8': {
      'en': 'Alliance Color',
      'zh_Hans': '联盟颜色',
    },
    '1wmsoayh': {
      'en': 'Red',
      'zh_Hans': '红色',
    },
    'arhrp87o': {
      'en': 'Blue',
      'zh_Hans': '蓝色',
    },
    'mx57bois': {
      'en': 'Automatons',
      'zh_Hans': '自动',
    },
    'wvxgrtxn': {
      'en': 'High Basket',
      'zh_Hans': '高篮子',
    },
    'ajb1p3wv': {
      'en': 'Low Basket',
      'zh_Hans': '低篮子',
    },
    'hjep03kd': {
      'en': 'High Chamber',
      'zh_Hans': '高室',
    },
    'hhki7uaf': {
      'en': 'Low Chamber',
      'zh_Hans': '低室',
    },
    '7a7zy61i': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'pgd3pwav': {
      'en': 'Automatons Endgame',
      'zh_Hans': '自动结束机器人位置',
    },
    't69ywb0i': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    '8lt4gq2o': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'o05ysb2q': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'zky8jos3': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    '1lm1yk3t': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    't064w3nw': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'a5gsyieo': {
      'en': 'Teleop',
      'zh_Hans': '手动',
    },
    'cum2tniw': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'chlr8or5': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'ue5dngyy': {
      'en': 'High Chamber',
      'zh_Hans': '高室',
    },
    's0tzf8ln': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    'saer786x': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'qqbo13zd': {
      'en': 'Teleop Endgame',
      'zh_Hans': '手动机器人结束位置',
    },
    'slq7t15s': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    '2reb4q0u': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    '5ksd08l3': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    '4yjboerc': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    '1235x8cz': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    '9uuguyyv': {
      'en': 'Level 2 Ascent',
      'zh_Hans': '二级上升',
    },
    'orbfuxx3': {
      'en': 'Level 3 Ascent',
      'zh_Hans': '三级上升',
    },
    'blp6cu4j': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'e7wehs25': {
      'en': 'Comments',
      'zh_Hans': '评论',
    },
    '9i9hq9zb': {
      'en': 'TextField',
      'zh_Hans': '文本框',
    },
    'rp6fn6hl': {
      'en': 'Add',
      'zh_Hans': '添加',
    },
    '46ahoprt': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // compscouthome
  {
    '5fgj2mix': {
      'en': 'Matches',
      'zh_Hans': '比赛',
    },
    'zc3lyyy6': {
      'en': 'Export',
      'zh_Hans': '+ 添加',
    },
    '7hdjv6ut': {
      'en': '+ Add',
      'zh_Hans': '+ 添加',
    },
    'jclcn62b': {
      'en': 'Team number',
      'zh_Hans': '队号',
    },
    '6sfcp9av': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'b45t4v22': {
      'en': 'Sort Types',
      'zh_Hans': '排序类型',
    },
    'w6x9806o': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    '9fw3ngnu': {
      'en': 'Auto Sample',
      'zh_Hans': '自动标本',
    },
    'v7s2jqin': {
      'en': 'Auto Spec',
      'zh_Hans': '自动样本',
    },
    '4rfjws3m': {
      'en': 'Teleop Sample',
      'zh_Hans': '手动标本',
    },
    '2jqib60q': {
      'en': 'Teleop Spec',
      'zh_Hans': '手动样本',
    },
    'yh6zge31': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'hxp0jgno': {
      'en': 'Descending',
      'zh_Hans': '降序',
    },
    '289m78ki': {
      'en': 'Sort Direction',
      'zh_Hans': '排序方向',
    },
    '15vwmred': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    '6q52sles': {
      'en': 'Ascending',
      'zh_Hans': '升序',
    },
    'h80v9qfu': {
      'en': 'Descending',
      'zh_Hans': '降序',
    },
    '2v728do7': {
      'en': '-',
      'zh_Hans': '',
    },
    'kf6njvf9': {
      'en': '-',
      'zh_Hans': '',
    },
    'zwce6rf7': {
      'en': 'COMP',
      'zh_Hans': '比赛',
    },
    'apmpo4l5': {
      'en': 'PIT',
      'zh_Hans': '基地',
    },
    'pcm9fuqc': {
      'en': 'COMP Scout',
      'zh_Hans': '比赛侦察',
    },
  },
  // pitscouthome
  {
    '56c4jak2': {
      'en': 'Pits',
      'zh_Hans': '基地',
    },
    '8mf10aua': {
      'en': '+ Add',
      'zh_Hans': '+ 添加',
    },
    '9lb0n9ks': {
      'en': 'Team number',
      'zh_Hans': '球队号码',
    },
    'vks9639r': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'wg5endw4': {
      'en': 'Sort Types',
      'zh_Hans': '排序类型',
    },
    'zedf5ff3': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'kckxwo04': {
      'en': 'None',
      'zh_Hans': '自动标本',
    },
    '7r9fqfsj': {
      'en': 'Auto Sample',
      'zh_Hans': '自动样本',
    },
    'v13vg6dt': {
      'en': 'Auto Specimen',
      'zh_Hans': '自动标本',
    },
    'iiqafhph': {
      'en': 'Auto Net',
      'zh_Hans': '自动网区',
    },
    'odvj7l36': {
      'en': 'Teleop Sample',
      'zh_Hans': '手动样本',
    },
    'wuxnrure': {
      'en': 'Teleop Specimen',
      'zh_Hans': '手动标本',
    },
    'zo6sgup1': {
      'en': 'Teleop Net',
      'zh_Hans': '手动网区',
    },
    'pt1a9nlv': {
      'en': 'Descending',
      'zh_Hans': '降序',
    },
    'hitibzb8': {
      'en': 'Sort Direction',
      'zh_Hans': '排序方向',
    },
    'mtl7057v': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'fuhak8go': {
      'en': 'Ascending',
      'zh_Hans': '升序',
    },
    'cntqyq1k': {
      'en': 'Descending',
      'zh_Hans': '降序',
    },
    'ucpwgynz': {
      'en': 'COMP',
      'zh_Hans': '比赛',
    },
    'v0b54o88': {
      'en': 'PIT',
      'zh_Hans': '基地',
    },
    'u4vftxw3': {
      'en': 'COMP Scout',
      'zh_Hans': 'COMP 侦察',
    },
  },
  // editmatchscout
  {
    'w26ulv25': {
      'en': 'Edit Match Record',
      'zh_Hans': '编辑比赛记录',
    },
    'behn244d': {
      'en': 'Match number#',
      'zh_Hans': '比赛号码#',
    },
    'cypyk6l3': {
      'en': 'e.g. 6',
      'zh_Hans': '例如 6',
    },
    'jxz3pjma': {
      'en': 'Team number#',
      'zh_Hans': '队号#',
    },
    'e09sg3vq': {
      'en': 'e.g. 19666',
      'zh_Hans': '例如 19666',
    },
    'fa63fjss': {
      'en': 'Match Type',
      'zh_Hans': '比赛类型',
    },
    'wiqeidvv': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'v7ykbofz': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'mpjs62jd': {
      'en': 'Qualifications',
      'zh_Hans': '资格赛',
    },
    'mjztuko0': {
      'en': 'Playoffs',
      'zh_Hans': '淘汰赛',
    },
    '139i5m6z': {
      'en': 'Practice',
      'zh_Hans': '练习赛',
    },
    'y4mbtc01': {
      'en': 'Alliance Color',
      'zh_Hans': '联盟色彩',
    },
    'a68jhp01': {
      'en': 'Red',
      'zh_Hans': '红色',
    },
    'azdipw2u': {
      'en': 'Blue',
      'zh_Hans': '蓝色',
    },
    'n5a6zh6u': {
      'en': 'Automatons',
      'zh_Hans': '自动',
    },
    '993cn317': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'egpoljwu': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'rpeictgk': {
      'en': 'High Chamber',
      'zh_Hans': '高室',
    },
    'r1t659lm': {
      'en': 'Low Chamber',
      'zh_Hans': '低室',
    },
    'wwvn2o6d': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'i45ha8ss': {
      'en': 'Automatons Endgame',
      'zh_Hans': '自动结束机器人位置',
    },
    '1522t8r6': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'hpgwuxd4': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    '7im0qmdt': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'pm2ljff7': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    'vdp1tcm7': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'v6ekgscr': {
      'en': 'Teleop',
      'zh_Hans': '手动',
    },
    '2purqd9v': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'k3y5ivs7': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'ryqebg70': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    '78fuf0q3': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    '9cdzze0o': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'ggve18xy': {
      'en': 'Teleop Endgame',
      'zh_Hans': '手动结束机器人位置',
    },
    'xkpntgkj': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'jtb0m94h': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'mld3vjh2': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'prmctcl5': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    '3wuahp33': {
      'en': 'Level 2 Ascent',
      'zh_Hans': '二级上升',
    },
    'ahj2zbjm': {
      'en': 'Level 3 Ascent',
      'zh_Hans': '三级上升',
    },
    '4w7c3571': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'iodiv8wk': {
      'en': 'Comments',
      'zh_Hans': '评论',
    },
    'wqqudhp4': {
      'en': 'TextField',
      'zh_Hans': '文本框',
    },
    'g0cjua4h': {
      'en': 'Update',
      'zh_Hans': '更新',
    },
    '5ap4o0bm': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // addpitsout
  {
    'xod6h460': {
      'en': 'Add Pit Record',
      'zh_Hans': '添加基地记录',
    },
    'bz4rm0t0': {
      'en': 'Team number#',
      'zh_Hans': '队号#',
    },
    'ijdboevm': {
      'en': 'e.g. 19666',
      'zh_Hans': '例如 19666',
    },
    'fh2c34k1': {
      'en': 'Expect Automatons',
      'zh_Hans': '期待自动情况',
    },
    'eio1urlz': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'l36gp7xx': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'z17mm0mp': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    '21zqsrbp': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    'jjyd3995': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    's694mvsh': {
      'en': 'Expect Automatons Endgame',
      'zh_Hans': '期待自动结束机器人状态',
    },
    'ggwvbpvj': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'zy3cipe9': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    '2mxl3wbk': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'i7hptdfm': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'z6i966ur': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    'm6lbk51d': {
      'en': 'None',
      'zh_Hans': '自动标本',
    },
    'jg6x6lw4': {
      'en': 'Expect Teleop',
      'zh_Hans': '期待手动结束机器人位置',
    },
    'iehqcmnu': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'jod8j61p': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    '1dnb521x': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    '012jeajd': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    's18230kb': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'jk1313of': {
      'en': 'Expect Teleop Endgame',
      'zh_Hans': '期待手动结束机器人位置',
    },
    'supykkuq': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'qvcrbqew': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'iuwqr1dh': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'bmgl67ja': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'g2c04i6u': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    'jt99ufgp': {
      'en': 'Level 2 Ascent',
      'zh_Hans': '二级上升',
    },
    'yj90eb0a': {
      'en': 'Level 3 Ascent',
      'zh_Hans': '三级上升',
    },
    '49ezsnwa': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    's1br9ba1': {
      'en': 'Robot Picture',
      'zh_Hans': '机器人图片',
    },
    'vp1kemi4': {
      'en': 'Comments',
      'zh_Hans': '评论',
    },
    'xqyl0f82': {
      'en': 'TextField',
      'zh_Hans': '文本框',
    },
    'vy7bjv6i': {
      'en': 'Add',
      'zh_Hans': '添加',
    },
    's7llg5s8': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // editpitsout
  {
    '3eic70oe': {
      'en': 'Edit Pit Record',
      'zh_Hans': '编辑基地记录',
    },
    '30eaho5m': {
      'en': 'Team number#',
      'zh_Hans': '队号#',
    },
    'd9a2tmrm': {
      'en': 'e.g. 19666',
      'zh_Hans': '例如 19666',
    },
    'wz9o5qsz': {
      'en': 'Expect Automatons',
      'zh_Hans': '期待自动情况',
    },
    'ehewlruc': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    '6l7bri82': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'js9nv2nh': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    'hfspn3rj': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    'exotoj15': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'ap5gmex2': {
      'en': 'Expect Automatons Endgame',
      'zh_Hans': '期待自动结束机器人位置',
    },
    'm0dq0igl': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    '43z17s5q': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'y6evkom5': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'kl0m8n7e': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    '0p1dodlz': {
      'en': 'None',
      'zh_Hans': '自动标本',
    },
    'bt6tqha2': {
      'en': 'Expect Teleop',
      'zh_Hans': '期待手动情况',
    },
    'r61ve3u1': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'w4pgdxuz': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'xtflszrr': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    'lesnln07': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    'oxluoyc2': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'dihzecle': {
      'en': 'Expect Teleop Endgame',
      'zh_Hans': '期待 Teleop 终局',
    },
    'omoxvyjd': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'a4op0t98': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    '0tn4sdcg': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    'njqmskz7': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    '69t9kbwx': {
      'en': 'Level 2 Ascent',
      'zh_Hans': '二级上升',
    },
    'xxfdy4b6': {
      'en': 'Level 3 Ascent',
      'zh_Hans': '三级上升',
    },
    'b63i8v5y': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'srouhw5g': {
      'en': 'Robot Picture',
      'zh_Hans': '机器人图片',
    },
    'tgs8wx0d': {
      'en': 'Comments',
      'zh_Hans': '评论',
    },
    '04hho18t': {
      'en': 'TextField',
      'zh_Hans': '文本框',
    },
    'bo0dg5si': {
      'en': 'Update',
      'zh_Hans': '更新',
    },
    'rr48q7r2': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // teamdetails
  {
    'icjzb93e': {
      'en': 'Team Details',
      'zh_Hans': '队伍详细信息',
    },
    'kcebs5e2': {
      'en': 'Edit',
      'zh_Hans': '编辑',
    },
    '8wj8xen4': {
      'en': 'Profile',
      'zh_Hans': '队伍档案',
    },
    '4dhkbvvp': {
      'en': 'Matchs Insight',
      'zh_Hans': '比赛洞察',
    },
    'fcndswwo': {
      'en': 'Team number#',
      'zh_Hans': '队号#',
    },
    'a4zzl0tq': {
      'en': 'e.g. 19666',
      'zh_Hans': '例如 19666',
    },
    'ozpu6i6d': {
      'en': 'Expect Automatons',
      'zh_Hans': '期待自动情况',
    },
    'bxjxd76a': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'sybr8k5q': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'g0x75ydz': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    'e3y1sov5': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    '4tvygal6': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'mfi4t5bg': {
      'en': 'Expect Automatons Endgame',
      'zh_Hans': '期待自动结束机器人位置',
    },
    '62onrnx4': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    'q6mj2x23': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'uckjw3to': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    '2ecym3d3': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    'wzy3xkte': {
      'en': 'None',
      'zh_Hans': '自动标本',
    },
    'zz4266ia': {
      'en': 'Expect Teleop',
      'zh_Hans': '期待手动情况',
    },
    '1tqt1mgr': {
      'en': 'High Basket',
      'zh_Hans': '高篮',
    },
    'miwssve3': {
      'en': 'Low Basket',
      'zh_Hans': '低篮',
    },
    'q1y47tac': {
      'en': 'High Chember',
      'zh_Hans': '高室',
    },
    'l3u7jcqf': {
      'en': 'Low Chember',
      'zh_Hans': '低室',
    },
    'zopj47sm': {
      'en': 'Net',
      'zh_Hans': '网区',
    },
    'f0ae078j': {
      'en': 'Expect Teleop Endgame',
      'zh_Hans': '期待 Teleop 终局',
    },
    'y5porqo4': {
      'en': 'Select...',
      'zh_Hans': '选择...',
    },
    '89vsstxq': {
      'en': 'Search...',
      'zh_Hans': '搜索...',
    },
    'zvypjcur': {
      'en': 'Observation Zone',
      'zh_Hans': '观察区',
    },
    '2kvj7ylf': {
      'en': 'Level 1 Ascent',
      'zh_Hans': '一级上升',
    },
    'knqw7u1n': {
      'en': 'Level 2 Ascent',
      'zh_Hans': '二级上升',
    },
    'nq6zc76m': {
      'en': 'Level 3 Ascent',
      'zh_Hans': '三级上升',
    },
    'rrs6nazf': {
      'en': 'None',
      'zh_Hans': '没有',
    },
    'mf6i4qrs': {
      'en': 'Robot Picture',
      'zh_Hans': '机器人图片',
    },
    'o92ije0n': {
      'en': 'Comments',
      'zh_Hans': '评论',
    },
    'qtv7n74k': {
      'en': 'TextField',
      'zh_Hans': '文本框',
    },
    'nim2623x': {
      'en': 'Overall Statistic',
      'zh_Hans': '总体统计',
    },
    'qmap3j60': {
      'en': 'Mean Auto',
      'zh_Hans': '平均自动得分',
    },
    'bkdtacpb': {
      'en': 'Mean Teleop',
      'zh_Hans': '平均手动得分',
    },
    '7hy7us8t': {
      'en': 'Mean Total',
      'zh_Hans': '平均总得分',
    },
    'mnz0rl3o': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // updatepassword
  {
    '2dpjb99s': {
      'en': 'Update Password',
      'zh_Hans': '更新密码',
    },
    'ex4qozoi': {
      'en': 'Current Password',
      'zh_Hans': '当前密码',
    },
    '93kuqdv7': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'n8fzyng1': {
      'en': 'New Password',
      'zh_Hans': '新密码',
    },
    '0kjgneay': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'wo7t6gql': {
      'en': 'Retype your new Password',
      'zh_Hans': '重新输入您的新密码',
    },
    '5ozephya': {
      'en': 'Password',
      'zh_Hans': '密码',
    },
    'qm3axcy0': {
      'en': 'Update Password',
      'zh_Hans': '更新密码',
    },
    'smigm1ps': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // about
  {
    'smd0yeo5': {
      'en': 'FTC Scout',
      'zh_Hans': 'FTC Scout',
    },
    'g9i5ce7a': {
      'en': 'About the App',
      'zh_Hans': '关于',
    },
    '588ruv7w': {
      'en':
          'This app is made by Team 19666 and distributed through the Depth Lab Program. Our mission is to empower FIRST Tech Challenge (FTC) teams with an easy-to-use, efficient scouting tool designed to help teams analyze, track, and improve their performance throughout the competition season.',
      'zh_Hans':
          '此应用由 Team 19666 制作，并通过 Depth Lab 计划分发。我们的使命是为 FIRST Tech Challenge (FTC) 团队提供易于使用、高效的侦察工具，旨在帮助团队分析、跟踪和提高整个比赛季的表现。',
    },
    '0cq19l6t': {
      'en': 'Stay Connected:',
      'zh_Hans': '关注我们：',
    },
    'e1m0rfq1': {
      'en': 'info@depthlab.us.kg',
      'zh_Hans': 'info@depthlab.us.kg',
    },
    '4bqamap6': {
      'en': 'info@ftc19666.org',
      'zh_Hans': 'info@ftc19666.org',
    },
    'ctrvxjge': {
      'en': 'www.depthlab.us.kg',
      'zh_Hans': 'www.depthlab.us.kg',
    },
    'yku030zd': {
      'en': 'www.ftc19666.org',
      'zh_Hans': 'www.ftc19666.org',
    },
    '9jcnje4i': {
      'en': 'Home',
      'zh_Hans': '主页',
    },
  },
  // Miscellaneous
  {
    '8ku1d9am': {
      'en': '',
      'zh_Hans': '',
    },
    'ls1gd85f': {
      'en': '',
      'zh_Hans': '',
    },
    'p7h7t8xx': {
      'en': '',
      'zh_Hans': '',
    },
    'ltvp0yci': {
      'en': '',
      'zh_Hans': '',
    },
    '8picrkij': {
      'en': '',
      'zh_Hans': '',
    },
    'atfkkm8h': {
      'en': '',
      'zh_Hans': '',
    },
    'rjko991d': {
      'en': '',
      'zh_Hans': '',
    },
    'fjetyv9e': {
      'en': '',
      'zh_Hans': '',
    },
    'bh03v41i': {
      'en': '',
      'zh_Hans': '',
    },
    'mgv3f7gk': {
      'en': '',
      'zh_Hans': '',
    },
    'na1221ll': {
      'en': '',
      'zh_Hans': '',
    },
    'sg40noe1': {
      'en': '',
      'zh_Hans': '',
    },
    'kruxuexe': {
      'en': '',
      'zh_Hans': '',
    },
    'mhiii5sx': {
      'en': '',
      'zh_Hans': '',
    },
    'isr5ax97': {
      'en': '',
      'zh_Hans': '',
    },
    'ymp8zxfm': {
      'en': '',
      'zh_Hans': '',
    },
    'iwan84rp': {
      'en': '',
      'zh_Hans': '',
    },
    'o8upj5kh': {
      'en': '',
      'zh_Hans': '',
    },
    'kuky3dlx': {
      'en': '',
      'zh_Hans': '',
    },
    'g8cqf9y6': {
      'en': '',
      'zh_Hans': '',
    },
    '34zol1f2': {
      'en': '',
      'zh_Hans': '',
    },
    '7zhyrivz': {
      'en': '',
      'zh_Hans': '',
    },
    'uis468uh': {
      'en': '',
      'zh_Hans': '',
    },
    'eg6jwthp': {
      'en': '',
      'zh_Hans': '',
    },
    'lksqyjp2': {
      'en': '',
      'zh_Hans': '',
    },
    'q8rqm4pr': {
      'en': '',
      'zh_Hans': '',
    },
    'b9r3a9nt': {
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
