// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:flutter_tianji/common/i18n/intl/messages_all.dart';
import 'package:flutter_tianji/providers/local_provider.dart';
import 'package:intl/intl.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class Tr {
  Tr(this.localeName);
  static Locale locales;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
  LocalProvider localProvider = new LocalProvider();

  static Future<Tr> load(Locale locale) {
    locales = locale;
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return Tr(localeName);
    });
  }

  static Tr of(BuildContext context) {
    return Localizations.of<Tr>(context, Tr);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'GSK',
      name: 'appName',
      desc: '应用名称',
      args: [],
    );
  }

  //本demo只对四个文本进行了国际化,包括主界面标题...
  static Map<String, Map<String, String>> _localizedValues = {
    'CN': {
      'main Home': '首页',
      'main Encyclopedia': '项目百科',
      'main Strategy': '策略库',
      'main Business': '商业API',
      'main Assets': '资产',
      'login Email': '邮箱登陆',
      'login Phone': '手机登陆',
      'Welcome Login': '欢迎登陆',
      'hint input email': '请输入邮箱',
      'hint input phone': '请输入手机号',
      'hint input VerificationCode': '请输入验证码',
      'E-mail verification': '邮箱验证',
      'Login password': '密码登陆',
      'forget password': '忘记密码',
      'Login': '登录',
      'create Account': '创建账户',
      'hint input EmailOrPhone': '请输入手机号或邮箱账号',
      'hint input password': '请输入密码',
      'Login successful': '登录成功',
      'Login VerificationCode': '验证码登陆',
      'Next step': '下一步',
      'have Account': '已有账号,',
      'Go to login': '去登录',
      'Email verification': '邮箱验证',
      'asset Coin': '币币资产',
      'asset Contract': '合约资产',
      'asset Coin record': '币币财务记录',
      'asset Contract record': '合约财务记录',
      'asset Freeze': '冻结',
      'asset Converted amount': '折合金额',
      'asset Recharge': '充币',
      'asset Withdrawal': '提币',
      'asset Transfer': '划转',
      'asset To trade': '去交易',
      'asset Withdrawal Hint': '扫描二维码获取充币地址',
      'asset Copy address': '复制地址',
      'asset Tips': '温馨提示',
      'asset No More': '没有更多',
      'asset Choose': '请选择',
      'asset Billing Detail': '账单明细',
      'asset Address': '地址',
      'asset Chain name': '链名称',
      'asset Transaction ID': '交易ID',
      'asset Transaction hour': '交易时间',
      'asset Trading status': '交易状态',
      'asset Coin account': '币币账户',
      'asset Contract account': '合约账户',
      'asset TransferQuantity hint': '请输入划转数量',
      'asset No available': '无可用资金',
      'asset Confirm transfer': '确认划转',
      'asset QuantityEmpty hint': '划转数量不能为空',
      'asset Successful transfer': '划转成功',
      'asset Balance': '余额',
      'asset Current currency': '当前币种',
      'asset safety verification': '安全验证',
      'asset Successful withdrawal': '申请提现成功',
      'asset Search': '搜索',
      'asset Withdrawal Hint2': '请输入提币地址',
      'asset ALL': '全提',
      'asset Arrival quantity': '到账数量',
      'asset Carry on': '继续',
      'asset Withdrawal Max hint': '单次最大提币',
      'asset NoFundpwd': '您还没有设置资金密码，为了您的 账户安全，请前往设置。',
      'asset Set': '立即设置',
      'asset protection': '账号保护',
      'asset Withdrawal hint3': '24小时内无法提币',
      'asset Empty hint1': '提币地址不能为空',
      'asset Empty hint2': '提币数量不能为空',
      'asset Valuation coin': '币币资产估值',
      'asset Valuation coin contract': '合约资产估值',
      'asset Nonactivated': '未开通',
      'asset Activation': '激活合约交易账户',
      'asset Account Equity': '账户权益',
      'asset equity': '当前权益',
      'asset hold': '持仓（手）',
      'asset Hide': '隐藏小额币种',
      'asset 7 Day': '最近7天',
      'asset 7-1 month': '7天至1个月',
      'asset 7-3 month': '7天至3个月',
      'asset Date': '日期',
      'asset Transaction Type': '交易类型',
      'asset Choose type': '选择类型',
      'asset Currency': '币种',
      'asset Choose currency': '选择币种',
      'asset Transfer1': '由合约账户转入',
      'asset Transfer2': '转出至合约账户',
      'asset completed': '已完成',
      'asset hand': '手',
      'asset Remarks': '备注',
      'asset amount': '金额',
      'Copy successfully': '复制成功',
      'tradr Available': '可用',
      'tradr fee': '手续费',
      'cancel': '取消',
      'determine': '確定',
      'Confirm': '确认',
      'Phone code hint': '手机验证码不能为空',
      'Email code hint': '邮箱验证码不能为空',
      'Google code hint': '谷歌验证码不能为空',
      'money password': '资金密码',
      'home No data': '暂无数据',
      'tradr Reset': '重置',
      'tradr All': '全部',
      'phone input hint': '请输入手机号',
      'mine': '我的',
      'Security center': '安全中心',
      'Authentication': '身份验证',
      'My assets': '我的资产',
      'Rate standard': '费率标准',
      'Promotion': '推广二维码',
      'Help center': '帮助中心',
      'version': '版本',
      'Latest version': '当前版本是最新',
      'sign out': '退出登录',
      'sign out hint': '是否确定退出？',
      'mine hint':
          '请不要轻信任何“HBit代充值”服务或向恶意地址充值数字货币的要求，增强资产安全意识。HBit不承认任何因用户过失产生的财产损失。 ',
      'mine hint2':
          '数字货币是一种高风险的投资方式，请您理性判断投资能力、谨慎作出投资选择。HBit会甄选优质币种，但不对 投资行为承担担保、赔偿等责任。 ',
      'bind mailbox': '绑定邮箱',
      'enter email address': '请输入您要绑定的邮箱账号',
      'mailbox': '邮箱',
      'submit Binding': '提交绑定',
      'Binding submitte': '已提交绑定',
      'bind Google': '绑定谷歌验证器',
      'bind Google Hint':
          '为了保障您的账户安全，请将16位密钥记录在纸上并安全保存。 如手机丢失，你可以通过该密钥恢复你的谷歌验证。',
      'Key': '密钥',
      'copy': '复制',
      'bind Phone': '绑定手机',
      'phone Number': '手机号',
      'Mobile verification code': '手机验证码',
      'modify Login Password': '修改登录密码',
      'modify Login Password Hint': '为了您的资金安全，修改登录密码后24小时内不允许提币。',
      'original Login Password': '原登录密码',
      'Login Password hint': '6-32位，含一种以上字母/数字/符号组合',
      'New login password': '新登录密码',
      'Repeat password': '重复输入密码',
      'Confirm new password': '确认新密码',
      'submit': '提交',
      'oldpassword empty hint': '原密码不能为空',
      'Password changed': '密码已修改',
      'Change fund password': '修改资金密码',
      'password limit hint': '请输入6位数字',
      'New money password': '新资金密码',
      'Confirm money password': '确认资金密码',
      'moneypwd empty hint': '资金密码不能为空',
      'moneypwd empty hint2': '确认资金密码不能为空',
      'Successfully modified': '修改成功',
      'Follow': '关注我们',
      'WeChat': '微信',
      'We chat number': '微信号',
      'Weibo': '微博',
      'customer service': '客户服务',
      'market collaboration': '市场合作',
      'Community hint': '欢迎加入HBit官方社群',
      'Saved album': '已保存至相册',
      'Save failed': '保存失败',
      'Save hint': '长按或截图保存二维码',
      'ID card': '身份证',
      'passport': '护照',
      'China Mainland': '中国大陆',
      'area': '国家/地区',
      'input name hint2': '请输入名字',
      'name': '名字',
      'input name hint': '请输入姓氏',
      'Last name': '姓氏',
      'Authentication type': '认证类型',
      'input ID card': '请输入证件号',
      'ID number': '证件号码',
      'ID number hint': '证件号码15-18位数',
      'ID number hint2': '上传证件正面',
      'ID number hint3': '上传证件反面',
      'ID number hint4': '手持身份证及证明',
      'Upload request': '上传要求',
      'Upload hint': '*请上传清晰的证件照片，必须能看清证件号和姓名',
      'Upload hint2': '*仅支持PNG、JPG、JPEG格式，每张大小限制在2M 以内',
      'Upload hint3': '*手持证件照需要包含“HBit”和当日日期',
      'Upload hint4': '拍摄提示',
      'standard': '标准',
      'Upload hint5': '边框缺失',
      'Upload hint6': '照片模糊',
      'Upload hint7': '闪光强烈',
      'Mainland China users': '中国大陆用户',
      'other area': '其他国家或地区用户',
      'History login': '历史登录',
      'interview time': '访问时间',
      'equipment': '设备',
      'Set successfully': '设置成功',
      'Currency rate': '币币费率',
      'Contract rate': '合约费率',
      'Withdrawal fee': '提币手续费',
      'login password': '登录密码',
      'modify': '修改',
      'Cell phone': '手机',
      'Google authentication': '谷歌验证',
      'unbounded': '去绑定',
      'Bound': '已绑定',
      'Go to set': '去设置',
      'To modify': '去修改',
      'invite friends': '邀请好友',
      'invite hint': '邀请你加入HBit，长按识别二维码',
      'Save album': '保存相册',
      'Set code': '设置防钓鱼码',
      'Set code hint': '防钓鱼码可以防范假冒HBit网站和邮件。设置后HBit给您发 送邮件中包含此码，没有包含的作为诈骗邮件。',
      'Set code hint2': '请输入8-32位英文或数字',
      'Anti-phishing code': '防钓鱼码',
      'Certification again': '再次认证',
      'password hint2': '两次输入的密码不一样，请重新输入',
      'email input hint': '请输入邮箱',
      'email code input hint': '请输入邮箱验证码',
      'enter Google verification code': '请输入谷歌验证码',
      'choose Country Hint': '请输入国家',
      'searche noRecord': '暂无记录',
      'choose Country': '选择国家',
      'Password cannot be empty': '新密码不能为空',
      'confirm password hint': '确认密码不能为空',
      'IDCard photo': '身份證正面照',
      'IDCard photo2': '身份證反面照',
      'IDCard photoHint2': '手持身份證及聲明',
      'upload passport': '上傳證件內頁照',
      'upload passport2': '上傳手持證件照',
      'upload passport3': '手持證件及證明',
      'upload passport4': '上傳要求',
      'upload passport5': '請上傳清晰的證件照片，必須能看清證件號和姓名',
      'upload passport6': '僅支持PNG、JPG、JPEG格式，每張大小限制在2M 以內',
      'upload passport7': '手持證件照需要包含“HBit”和當日日期',
      'Certificate authentication': '證件認證',
      're-upload': '重新上传',
      'Upload successfully': '上傳成功',
      'Upload failed': '上傳失敗',
      'Photo album': '相冊',
      'Take pictures': '拍照',
      'Find password': '找回密码',
      'EmailOrPhone': '邮箱或手机号',
      'hint password limit': '登录密码6-20位，且为数字字母组合',
      'Set New Password': '设置新密码',
      'hint input Password2': '请再次输入新密码',
      'enter name': '请输入名字',
    },
    'US': {
      'main Home': 'Home',
      'main Encyclopedia': 'Encyclopedia',
      'main Strategy': 'Strategy',
      'main Business': 'Business',
      'main Assets': 'Assets',
      'login Email': 'Login email',
      'login Phone': 'Login phone',
      'Welcome Login': 'Welcome Login',
      'hint input email': 'Please input your email',
      'hint input phone': 'Please input phone number',
      'hint input VerificationCode': 'Please input verification code',
      'Email verification': 'E-mail verification',
      'Login password': 'Password login',
      'forget password': 'Forget password',
      'Login': 'Login',
      'create Account': 'create Account',
      'hint input EmailOrPhone':
          'Please enter your phone number or email account',
      'hint input password': 'Please enter password',
      'Login successful': 'Login successful',
      'Login VerificationCode': 'Verification code',
      'Next step': 'Next',
      'have Account': '',
      'Go to login': 'Go to login',
      'asset Coin': 'Currency',
      'asset Contract': 'Contract',
      'asset Coin record': 'Financial record',
      'asset Contract record': 'Financial record',
      'asset Freeze': 'Freeze',
      'asset Converted amount': 'Converted amount',
      'asset Recharge': 'Recharge',
      'asset Withdrawal': 'Withdrawal',
      'asset Transfer': 'Transfer',
      'asset To trade': 'To trade',
      'asset Withdrawal Hint': 'Scan the QR code to get the deposit address',
      'asset Copy address': 'Copy address',
      'asset Tips': 'Tips',
      'asset No More': 'No More',
      'asset Choose': 'Choose',
      'asset Billing Detail': 'Billing Detail',
      'asset Address': 'Address',
      'asset Chain name': 'Chain name',
      'asset Transaction ID': 'Transaction ID',
      'asset Transaction hour': 'Transaction hour',
      'asset Trading status': 'Trading status',
      'asset Coin account': 'Currency account',
      'asset Contract account': 'Contract account',
      'asset TransferQuantity hint': 'Enter transfer amount',
      'asset No available': 'No funds available',
      'asset Confirm transfer': 'Confirm transfer',
      'asset QuantityEmpty hint': 'Transfer amount cannot empty',
      'asset Successful transfer': 'Successful transfer',
      'asset Balance': 'Balance',
      'asset Current currency': 'Current currency',
      'asset safety verification': 'safety verification',
      'asset Successful withdrawal': 'Successful withdrawal',
      'asset Search': 'Search',
      'asset Withdrawal Hint2': 'Enter withdrawal address',
      'asset ALL': 'All',
      'asset Arrival quantity': 'Arrival quantity',
      'asset Carry on': 'Carry on',
      'asset Withdrawal Max hint': 'Max Withdrawal',
      'asset NoFundpwd':
          'You have not set the fund password. For the security of your account, please go to set。',
      'asset Set': 'Set',
      'asset protection': 'Account protection',
      'asset Withdrawal hint3': 'Cannot withdraw money within 24 hours',
      'asset Empty hint1': 'Withdrawal address cannot empty',
      'asset Empty hint2': 'Withdrawal quantity cannot empty',
      'asset Valuation coin': 'Currency Valuation',
      'asset Valuation coin contract': 'Contract Valuation',
      'asset Nonactivated': 'No open',
      'asset Activation': 'Activate contract trading account',
      'asset Account Equity': 'rights',
      'asset equity': 'Current rights',
      'asset hold': 'hold（hand）',
      'asset Hide': 'Hide',
      'asset 7 Day': 'recent 7 day',
      'asset 7-1 month': '7 days to 1 month',
      'asset 7-3 month': '7 days to 3 month',
      'asset Date': 'Date',
      'asset Transaction Type': 'Transaction Type',
      'asset Choose type': 'Choose type',
      'asset Currency': 'Currency',
      'asset Choose currency': 'Choose currency',
      'asset Transfer1': 'Into',
      'asset Transfer2': 'Out',
      'asset completed': 'Completed',
      'asset hand': '',
      'asset Remarks': 'Remarks',
      'asset amount': 'Amount',
      'Copy successfully': 'Copy successfully',
      'tradr Available': 'Available',
      'tradr fee': 'Entrust fee',
      'cancel': 'Cancel',
      'determine': 'Determine',
      'Confirm': 'Confirm',
      'Phone code hint': 'Phone verification code cannot be empty',
      'Email code hint': 'Email verification code cannot be empty',
      'Google code hint': 'Google verification code cannot be empty',
      'moneypwd empty hint': 'Money password cannot be empty',
      'money password': 'Password',
      'tradr Reset': ' Reset',
      'tradr All': 'All',
      'mine': 'Mine',
      'Security center': 'Security center',
      'Authentication': 'Authentication',
      'My assets': 'My assets',
      'Rate standard': 'Rate standard',
      'Promotion': 'Promotion',
      'Help center': 'Help center',
      'version': 'version',
      'Latest version': 'Latest version',
      'sign out': 'sign out',
      'sign out hint': 'Are you sure to exit？',
      'mine hint':
          'Please do not trust any "HBit recharge on behalf of" service or the requirement of recharging digital currency to malicious addresses, and enhance the awareness of asset security. HBit does not recognize any property losses caused by user negligence.',
      'mine hint2':
          'Digital currency is a high-risk investment method. Please judge your investment ability rationally and make investment choices cautiously. The HBit will select high-quality currencies, but will not assume responsibility for guarantees, compensation, etc. for investment activities. ',
      'bind mailbox': 'Bind mailbox',
      'enter email address': 'Enter the email  you want to bind',
      'mailbox': 'E-mail',
      'submit Binding': 'Submit binding',
      'Binding submitte': 'binding',
      'bind Google': 'Bind Google',
      'bind Google Hint':
          'To protect the security of your account, please record the 16-digit key on paper and keep it safe. If your phone is lost, you can use this key to restore your Google verification.',
      'Key': 'Key',
      'copy': 'Copy',
      'bind Phone': 'Bind phone',
      'phone Number': 'Phone number',
      'modify Login Password': 'Modify login password',
      'modify Login Password Hint':
          'For the safety of your funds, withdrawals are not allowed within 24 hours after changing the login password.',
      'original Login Password': 'Original',
      'Login Password hint':
          '6-32 bits, containing more than one letter/number/symbol combination',
      'New login password': 'New',
      'Repeat password': 'Repeat',
      'Confirm new password': 'Confirm',
      'submit': 'Submit',
      'oldpassword empty hint': 'The original password cannot be empty',
      'Password changed': 'Password changed',
      'Change fund password': 'Change money password',
      'password limit hint': 'Please enter 6 digits',
      'New money password': 'New',
      'Confirm money password': 'Confirm',
      'moneypwd empty hint2': 'Confirm fund password cannot be empty',
      'Successfully modified': 'Successfully modified',
      'Follow': 'Follow us',
      'WeChat': 'WeChat',
      'We chat number': 'We chat number',
      'Weibo': 'Weibo',
      'customer service': 'customer servic',
      'market collaboration': 'market collaboration',
      'Community hint': 'Welcome to the official HBit community',
      'Saved album': 'Saved album',
      'Save failed': 'Save failed',
      'Save hint': 'Long press or screenshot to save the QR code',
      'ID card': 'ID card',
      'passport': 'Passport',
      'China Mainland': 'China Mainland',
      'area': 'Country/region',
      'input name hint2': 'Please enter your name',
      'name': 'Name',
      'input name hint': 'Please enter Last name',
      'Last name': 'Last name',
      'Authentication type': 'Authentication type',
      'input ID card': 'Input ID card',
      'ID number': 'ID number',
      'ID number hint': 'The id number is 15-18 digits',
      'ID number hint2': 'Front of upload document',
      'ID number hint3': 'Reverse side of upload id',
      'ID number hint4': 'Carry your ID card and identification',
      'Upload request': 'Upload required',
      'Upload hint':
          '*Please upload clear id photo. Id number and name must be clear',
      'Upload hint2':
          '*Only PNG, JPG, JPEG formats are supported, each size is limited to 2M',
      'Upload hint3':
          '*The hand id photo needs to contain the "HBit" and the date of the day',
      'Upload hint4': 'Shoot tip',
      'standard': 'standard',
      'Upload hint5': 'Border missing',
      'Upload hint6': 'Image fuzzy',
      'Upload hint7': 'Flash strong',
      'Mainland China users': 'Mainland China users',
      'other area': 'Users from other countries or regions',
      'History login': 'History Login',
      'interview time': 'Access time',
      'equipment': 'Equipment',
      'Set successfully': 'Set successfully',
      'Currency rate': 'Currency rate',
      'Contract rate': 'Contract rate',
      'Withdrawal fee': 'Withdrawal fee',
      'login password': 'Login password',
      'modify': 'modify',
      'Cell phone': 'Phone',
      'unbounded': 'unbounded',
      'Bound': 'Bound',
      'Go to set': 'To set',
      'To modify': 'To modify',
      'invite friends': 'Invite friends',
      'invite hint': 'Invite you to join THE HBit, long press',
      'Save album': 'Save album',
      'Set code': 'Set anti-fishing code',
      'Set code hint':
          'Phishing codes protect against fake HBit websites and emails. After setting, the EMAIL sent by HBit to you contains this code, and those not included are regarded as fraudulent emails.',
      'Set code hint2': 'Please enter 8-32 digits in English or digits',
      'Anti-phishing code': 'Anti-phishing code',
      'password hint2': 'Password is different',
      'Certification again': 'Certification again',
      'email input hint': 'Please input your email',
      'email code input hint': 'Please enter email verification code',
      'enter Google verification code': 'Enter Google verification code',
      'phone input hint': 'Please enter phone number',
      'choose Country Hint': 'Please Choose Country',
      'searche noRecord': 'noRecord',
      'choose Country': 'Choose Country',
      'home No data': 'No data',
      'Password cannot be empty': 'Password cannot be empty',
      'confirm password hint': 'confirm password cannot be empty',
      'IDCard photo': 'ReverseSide photo',
      'IDCard photo2': 'Reverse photo',
      'IDCard photoHint2': 'Hold ID card and statement',
      'upload passport': 'Upload photo of the inside page of your ID',
      'upload passport2': 'Upload hand-held ID photo',
      'upload passport3': 'Hold ID and proof',
      'upload passport4': 'Upload reques',
      'upload passport5':
          'Please upload a clear ID photo, you must be able to see the ID number and name',
      'upload passport6':
          'Only support PNG, JPG, JPEG format, each size is limited to 2M',
      'upload passport7':
          'Hand-held ID photo needs to contain "H Bit" and the date of the day',
      'Certificate authentication': 'Certificate authentication',
      're-upload': 'Upload again',
      'Upload successfully': 'Upload successfully',
      'Upload failed': 'Upload failed',
      'Photo album': 'Photo album',
      'Take pictures': 'Pictures',
      'Find password': 'Find password',
      'EmailOrPhone': 'Email Or Phone',
      'enter name': 'Please enter the name',
      'hint password':
          'The login password is 6-20 digits, and is a combination of numbers and letters',
      'Set New Password': 'Set new password',
      'hint input Password2': 'Please enter the new password again',
    },
    'HK': {}
  };

  ///** 我的 **//

  get UploadSuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
        ['Upload successfully'];
  }

  get UploadFailed {
    return _localizedValues[localProvider.locale.countryCode]['Upload failed'];
  }

  get PhotoAlbum {
    return _localizedValues[localProvider.locale.countryCode]['Photo album'];
  }

  get TakePictures {
    return _localizedValues[localProvider.locale.countryCode]['Take pictures'];
  }

  get reUpload {
    return _localizedValues[localProvider.locale.countryCode]['re-upload'];
  }

  get IDCardPhoto {
    return _localizedValues[localProvider.locale.countryCode]['IDCard photo'];
  }

  get IDCardPhoto2 {
    return _localizedValues[localProvider.locale.countryCode]['IDCard photo2'];
  }

  get IDCardPhotoHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['IDCard photoHint2'];
  }

  get uploadPassport {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport'];
  }

  get CertificateAuthentication {
    return _localizedValues[localProvider.locale.countryCode]
        ['Certificate authentication'];
  }

  get uploadPassport2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport2'];
  }

  get bankCardHint {
    return _localizedValues[localProvider.locale.countryCode]['bank Card Hint'];
  }

  get uploadPassport3 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport3'];
  }

  get uploadPassport4 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport4'];
  }

  get uploadPassport5 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport5'];
  }

  get uploadPassport6 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport6'];
  }

  get uploadPassport7 {
    return _localizedValues[localProvider.locale.countryCode]
        ['upload passport7'];
  }

  get PasswordEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Password cannot be empty'];
  }

  get Nextstep {
    return _localizedValues[localProvider.locale.countryCode]['Next step'];
  }

  get confirmPasswordHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['confirm password hint'];
  }

  get searcheNoRecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche noRecord'];
  }

  get chooseCountry {
    return _localizedValues[localProvider.locale.countryCode]['choose Country'];
  }

  get chooseCountryHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['choose Country Hint'];
  }

  get phoneInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['phone input hint'];
  }

  get GoogleVerificationCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['enter Google verification code'];
  }

  get emailCodeInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['email code input hint'];
  }

  get emailInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['email input hint'];
  }

  get passwordHint2 {
    return _localizedValues[localProvider.locale.countryCode]['password hint2'];
  }

  get CertificationAgain {
    return _localizedValues[localProvider.locale.countryCode]
        ['Certification again'];
  }

  get GoogleAuthentication {
    return _localizedValues[localProvider.locale.countryCode]
        ['Google authentication'];
  }

  get MobileVerificationCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Mobile verification code'];
  }

  get inputNameHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['input name hint'];
  }

  get SuccessfullyModified {
    return _localizedValues[localProvider.locale.countryCode]
        ['Successfully modified'];
  }

  get Follow {
    return _localizedValues[localProvider.locale.countryCode]['Follow'];
  }

  get WeChat {
    return _localizedValues[localProvider.locale.countryCode]['WeChat'];
  }

  get WeChatNumber {
    return _localizedValues[localProvider.locale.countryCode]['We chat number'];
  }

  get Weibo {
    return _localizedValues[localProvider.locale.countryCode]['Weibo'];
  }

  get customerService {
    return _localizedValues[localProvider.locale.countryCode]
        ['customer service'];
  }

  get marketCollaboration {
    return _localizedValues[localProvider.locale.countryCode]
        ['market collaboration'];
  }

  get CommunityHint {
    return _localizedValues[localProvider.locale.countryCode]['Community hint'];
  }

  get SavedAlbum {
    return _localizedValues[localProvider.locale.countryCode]['Saved album'];
  }

  get Savefailed {
    return _localizedValues[localProvider.locale.countryCode]['Save failed'];
  }

  get SaveHint {
    return _localizedValues[localProvider.locale.countryCode]['Save hint'];
  }

  get IDCard {
    return _localizedValues[localProvider.locale.countryCode]['ID card'];
  }

  get Passport {
    return _localizedValues[localProvider.locale.countryCode]['passport'];
  }

  get ChinaMainland {
    return _localizedValues[localProvider.locale.countryCode]['China Mainland'];
  }

  get area {
    return _localizedValues[localProvider.locale.countryCode]['area'];
  }

  get enterName {
    return _localizedValues[localProvider.locale.countryCode]['enter name'];
  }

  get name {
    return _localizedValues[localProvider.locale.countryCode]['name'];
  }

  get inputNameHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['input name hint'];
  }

  get LastName {
    return _localizedValues[localProvider.locale.countryCode]['Last name'];
  }

  get AuthenticationType {
    return _localizedValues[localProvider.locale.countryCode]
        ['Authentication type'];
  }

  get inputIDcard {
    return _localizedValues[localProvider.locale.countryCode]['input ID card'];
  }

  get IDNumber {
    return _localizedValues[localProvider.locale.countryCode]['ID number'];
  }

  get IDNumberHint {
    return _localizedValues[localProvider.locale.countryCode]['ID number hint'];
  }

  get IDNumberHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint2'];
  }

  get IDNumberHint3 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint3'];
  }

  get IDNumberHint4 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint4'];
  }

  get UploadRequest {
    return _localizedValues[localProvider.locale.countryCode]['Upload request'];
  }

  get UploadHint {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint'];
  }

  get UploadHint2 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint2'];
  }

  get UploadHint3 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint3'];
  }

  get UploadHint4 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint4'];
  }

  get UploadHint5 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint5'];
  }

  get UploadHint6 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint6'];
  }

  get UploadHint7 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint7'];
  }

  get standard {
    return _localizedValues[localProvider.locale.countryCode]['standard'];
  }

  get MainlandChinausers {
    return _localizedValues[localProvider.locale.countryCode]
        ['Mainland China users'];
  }

  get otherArea {
    return _localizedValues[localProvider.locale.countryCode]['other area'];
  }

  get HistoryLogin {
    return _localizedValues[localProvider.locale.countryCode]['History login'];
  }

  get interviewTime {
    return _localizedValues[localProvider.locale.countryCode]['interview time'];
  }

  get equipment {
    return _localizedValues[localProvider.locale.countryCode]['equipment'];
  }

  get moneyPassword {
    return _localizedValues[localProvider.locale.countryCode]['money password'];
  }

  get SetSuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
        ['Set successfully'];
  }

  get CurrencyRate {
    return _localizedValues[localProvider.locale.countryCode]['Currency rate'];
  }

  get WithdrawalFee {
    return _localizedValues[localProvider.locale.countryCode]['Withdrawal fee'];
  }

  get loginPassword {
    return _localizedValues[localProvider.locale.countryCode]['login password'];
  }

  get modify {
    return _localizedValues[localProvider.locale.countryCode]['modify'];
  }

  get CellPhone {
    return _localizedValues[localProvider.locale.countryCode]['Cell phone'];
  }

  get unbounded {
    return _localizedValues[localProvider.locale.countryCode]['unbounded'];
  }

  get Bound {
    return _localizedValues[localProvider.locale.countryCode]['Bound'];
  }

  get GoToSet {
    return _localizedValues[localProvider.locale.countryCode]['Go to set'];
  }

  get Tomodify {
    return _localizedValues[localProvider.locale.countryCode]['To modify'];
  }

  get inviteFriends {
    return _localizedValues[localProvider.locale.countryCode]['invite friends'];
  }

  get inviteHint {
    return _localizedValues[localProvider.locale.countryCode]['invite hint'];
  }

  get SaveAlbum {
    return _localizedValues[localProvider.locale.countryCode]['Save album'];
  }

  get SetCode {
    return _localizedValues[localProvider.locale.countryCode]['Set code'];
  }

  get SetCodeHint {
    return _localizedValues[localProvider.locale.countryCode]['Set code hint'];
  }

  get SetCodeHint2 {
    return _localizedValues[localProvider.locale.countryCode]['Set code hint2'];
  }

  get AntiPhishingCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Anti-phishing code'];
  }

  get oldpasswordEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['oldpassword empty hint'];
  }

  get Passwordchanged {
    return _localizedValues[localProvider.locale.countryCode]
        ['Password changed'];
  }

  get ChangeFundPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Change fund password'];
  }

  get passwordLimitHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['password limit hint'];
  }

  get NewMoneyPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['New money password'];
  }

  get ConfirmMoneyPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Confirm money password'];
  }

  get moneypwdEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['moneypwd empty hint'];
  }

  get moneypwdEmptyHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['moneypwd empty hint2'];
  }

  get phoneNumber {
    return _localizedValues[localProvider.locale.countryCode]['phone Number'];
  }

  get modifyLoginPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['modify Login Password'];
  }

  get modifyLoginPasswordHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['modify Login Password Hint'];
  }

  get originalLoginPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['original Login Password'];
  }

  get LoginPasswordhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Login Password hint'];
  }

  get Newloginpassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['New login password'];
  }

  get bindPhone {
    return _localizedValues[localProvider.locale.countryCode]['bind Phone'];
  }

  get RepeatPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Repeat password'];
  }

  get ConfirmNewPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Confirm new password'];
  }

  get submit {
    return _localizedValues[localProvider.locale.countryCode]['submit'];
  }

  get copy {
    return _localizedValues[localProvider.locale.countryCode]['copy'];
  }

  get Key {
    return _localizedValues[localProvider.locale.countryCode]['Key'];
  }

  get bindGoogleHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['bind Google Hint'];
  }

  get bindGoogle {
    return _localizedValues[localProvider.locale.countryCode]['bind Google'];
  }

  get BindingSubmitte {
    return _localizedValues[localProvider.locale.countryCode]
        ['Binding submitte'];
  }

  get submitBinding {
    return _localizedValues[localProvider.locale.countryCode]['submit Binding'];
  }

  get mailbox {
    return _localizedValues[localProvider.locale.countryCode]['mailbox'];
  }

  get enterEmailAddress {
    return _localizedValues[localProvider.locale.countryCode]
        ['enter email address'];
  }

  get bindMailbox {
    return _localizedValues[localProvider.locale.countryCode]['bind mailbox'];
  }

  get mine {
    return _localizedValues[localProvider.locale.countryCode]['mine'];
  }

  get copySuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
        ['Copy successfully'];
  }

  get securityCenter {
    return _localizedValues[localProvider.locale.countryCode]
        ['Security center'];
  }

  get authentication {
    return _localizedValues[localProvider.locale.countryCode]['Authentication'];
  }

  get myAssets {
    return _localizedValues[localProvider.locale.countryCode]['My assets'];
  }

  get rateStandard {
    return _localizedValues[localProvider.locale.countryCode]['Rate standard'];
  }

  get promotion {
    return _localizedValues[localProvider.locale.countryCode]['Promotion'];
  }

  get helpCenter {
    return _localizedValues[localProvider.locale.countryCode]['Help center'];
  }

  get version {
    return _localizedValues[localProvider.locale.countryCode]['version'];
  }

  get latestVersion {
    return _localizedValues[localProvider.locale.countryCode]['Latest version'];
  }

  get signOut {
    return _localizedValues[localProvider.locale.countryCode]['sign out'];
  }

  get signOutHint {
    return _localizedValues[localProvider.locale.countryCode]['sign out hint'];
  }

  get cancel {
    return _localizedValues[localProvider.locale.countryCode]['cancel'];
  }

  get determine {
    return _localizedValues[localProvider.locale.countryCode]['determine'];
  }

  get mineHint {
    return _localizedValues[localProvider.locale.countryCode]['mine hint'];
  }

  get mineHint2 {
    return _localizedValues[localProvider.locale.countryCode]['mine hint2'];
  }

  /*  */

  get tradrAll {
    return _localizedValues[localProvider.locale.countryCode]['tradr All'];
  }

  get TradrReset {
    return _localizedValues[localProvider.locale.countryCode]['tradr Reset'];
  }

  get homeNodata {
    return _localizedValues[localProvider.locale.countryCode]['home No data'];
  }

  get PhoneCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Phone code hint'];
  }

  get EmailCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Email code hint'];
  }

  get GoogleCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Google code hint'];
  }

  get Confirm {
    return _localizedValues[localProvider.locale.countryCode]['Confirm'];
  }

  get tradrFee {
    return _localizedValues[localProvider.locale.countryCode]['tradr fee'];
  }

  get tradrAvailable {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Available'];
  }

  ///** 资产 **//
  get assetWithdrawalMaxhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Max hint'];
  }

  get assetAmount {
    return _localizedValues[localProvider.locale.countryCode]['asset amount'];
  }

  get assetDate {
    return _localizedValues[localProvider.locale.countryCode]['asset Date'];
  }

  get assetHand {
    return _localizedValues[localProvider.locale.countryCode]['asset hand'];
  }

  get assetRemarks {
    return _localizedValues[localProvider.locale.countryCode]['asset Remarks'];
  }

  get assetTransactionType {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction Type'];
  }

  get assetChoosetype {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Choose type'];
  }

  get assetChoosecurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Choose currency'];
  }

  get assetTransfer1 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transfer1'];
  }

  get assetcompleted {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset completed'];
  }

  get assetTransfer2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transfer2'];
  }

  get assetCurrency {
    return _localizedValues[localProvider.locale.countryCode]['asset Currency'];
  }

  get assetValuationcoin {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Valuation coin'];
  }

  get assetValuationcoincontract {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Valuation coin contract'];
  }

  get assetNonactivated {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Nonactivated'];
  }

  get assetActivation {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Activation'];
  }

  get assetAccountEquity {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Account Equity'];
  }

  get assetEquity {
    return _localizedValues[localProvider.locale.countryCode]['asset equity'];
  }

  get assethold {
    return _localizedValues[localProvider.locale.countryCode]['asset hold'];
  }

  get assetHide {
    return _localizedValues[localProvider.locale.countryCode]['asset Hide'];
  }

  get asset7Day {
    return _localizedValues[localProvider.locale.countryCode]['asset 7 Day'];
  }

  get asset7o1month {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset 7-1 month'];
  }

  get asset7o3month {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset 7-3 month'];
  }

  get assetWithdrawalhint3 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal hint3'];
  }

  get assetEmptyhint1 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Empty hint1'];
  }

  get assetEmptyhint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Empty hint2'];
  }

  get assetSet {
    return _localizedValues[localProvider.locale.countryCode]['asset Set'];
  }

  get assetprotection {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset protection'];
  }

  get assetNoFundpwd {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset NoFundpwd'];
  }

  get assetCoin {
    return _localizedValues[localProvider.locale.countryCode]['asset Coin'];
  }

  get assetCoinaccount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Coin account'];
  }

  get assetContractaccount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Contract account'];
  }

  get assetTransferQuantityhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset TransferQuantity hint'];
  }

  get assetNoavailable {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset No available'];
  }

  get assetConfirmtransfer {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Confirm transfer'];
  }

  get assetQuantityEmptyhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset QuantityEmpty hint'];
  }

  get assetSuccessfultransfer {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Successful transfer'];
  }

  get assetBalance {
    return _localizedValues[localProvider.locale.countryCode]['asset Balance'];
  }

  get assetCurrentcurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Current currency'];
  }

  get assetsafetyverification {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset safety verification'];
  }

  get assetSuccessfulwithdrawal {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Successful withdrawal'];
  }

  get assetSearch {
    return _localizedValues[localProvider.locale.countryCode]['asset Search'];
  }

  get assetWithdrawalHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Hint2'];
  }

  get assetArrivalquantity {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Arrival quantity'];
  }

  get assetCarryon {
    return _localizedValues[localProvider.locale.countryCode]['asset Carry on'];
  }

  get assetALL {
    return _localizedValues[localProvider.locale.countryCode]['asset ALL'];
  }

  get assetContract {
    return _localizedValues[localProvider.locale.countryCode]['asset Contract'];
  }

  get assetCoinrecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Coin record'];
  }

  get assetContractrecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Contract record'];
  }

  get assetFreeze {
    return _localizedValues[localProvider.locale.countryCode]['asset Freeze'];
  }

  get assetConvertedamount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Converted amount'];
  }

  get assetRecharge {
    return _localizedValues[localProvider.locale.countryCode]['asset Recharge'];
  }

  get assetWithdrawal {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal'];
  }

  get assetTransfer {
    return _localizedValues[localProvider.locale.countryCode]['asset Transfer'];
  }

  get assetTotrade {
    return _localizedValues[localProvider.locale.countryCode]['asset To trade'];
  }

  get assetWithdrawalHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Hint'];
  }

  get assetCopyaddress {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Copy address'];
  }

  get assetTips {
    return _localizedValues[localProvider.locale.countryCode]['asset Tips'];
  }

  get assetNoMore {
    return _localizedValues[localProvider.locale.countryCode]['asset No More'];
  }

  get assetChoose {
    return _localizedValues[localProvider.locale.countryCode]['asset Choose'];
  }

  get assetBillingDetail {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Billing Detail'];
  }

  get assetAddress {
    return _localizedValues[localProvider.locale.countryCode]['asset Address'];
  }

  get assetChainname {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Chain name'];
  }

  get assetTransactionID {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction ID'];
  }

  get assetTransactionhour {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction hour'];
  }

  get assetTradingstatus {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Trading status'];
  }

  ///** 登陆 **//
  get FindPassword {
    return _localizedValues[localProvider.locale.countryCode]['Find password'];
  }

  get EmailOrPhone {
    return _localizedValues[localProvider.locale.countryCode]['EmailOrPhone'];
  }
/*

  get EmailOrPhone {
    return _localizedValues[localProvider.locale.countryCode]['EmailOrPhone'];
  }
*/

  get LoginEmail {
    return _localizedValues[localProvider.locale.countryCode]['login Email'];
  }

  get LoginPhone {
    return _localizedValues[localProvider.locale.countryCode]['login Phone'];
  }

  get WelcomeLogin {
    return _localizedValues[localProvider.locale.countryCode]['Welcome Login'];
  }

  get hintInputEmail {
    return _localizedValues[localProvider.locale.countryCode]
        ['hint input email'];
  }

  get hintInputPhone {
    return _localizedValues[localProvider.locale.countryCode]
        ['hint input phone'];
  }

  get EmailVerification {
    return _localizedValues[localProvider.locale.countryCode]
        ['Email verification'];
  }

  get LoginPassword {
    return _localizedValues[localProvider.locale.countryCode]['Login password'];
  }

  get ForgetPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['forget password'];
  }

  get Login {
    return _localizedValues[localProvider.locale.countryCode]['Login'];
  }

  get createAccount {
    return _localizedValues[localProvider.locale.countryCode]['create Account'];
  }

  get hintInputEmailOrPhone {
    return _localizedValues[localProvider.locale.countryCode]
        ['hint input EmailOrPhone'];
  }

  get hintInputPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['hint input password'];
  }

  get LoginSuccessful {
    return _localizedValues[localProvider.locale.countryCode]
        ['Login successful'];
  }

  get hintInputVerificationCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['hint input VerificationCode'];
  }

  get LoginVerificationCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Login VerificationCode'];
  }

  get haveAccount {
    return _localizedValues[localProvider.locale.countryCode]['have Account'];
  }

  get GoToLogin {
    return _localizedValues[localProvider.locale.countryCode]['Go to login'];
  }

  ///** 主页tab **//
  get mainHome {
    return _localizedValues[localProvider.locale.countryCode]['main Home'];
  }

  get mainEncyclopedia {
    return _localizedValues[localProvider.locale.countryCode]
        ['main Encyclopedia'];
  }

  get mainStrategy {
    return _localizedValues[localProvider.locale.countryCode]['main Strategy'];
  }

  get mainBusiness {
    return _localizedValues[localProvider.locale.countryCode]['main Business'];
  }

  get mainAssets {
    return _localizedValues[localProvider.locale.countryCode]['main Assets'];
  }

  String get aboutUs {
    return Intl.message(
      'aboutUs',
      name: 'aboutUs',
      desc: '关于我们',
      args: [],
    );
  }

  String get autoBySystem {
    return Intl.message(
      'Auto',
      name: 'autoBySystem',
      desc: '跟随系统',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Tr> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('zh', 'CH'),
      Locale('en', 'US'),
      Locale('zh', 'HK'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Tr> load(Locale locale) => Tr.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
