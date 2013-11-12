/*!
 * jQuery X Date Plugin v1.0(Dependent on jQueryX)
 * author: xiewulong
 * create: 2013/8/2
 * update: 2013/10/23
 */

(function(window, undefined){

	var jQueryXDate = function($){

			var $win	= $(window),
				$doc	= $(document),
				Fn		= function(){};

			$.fn.extend({

				//jQuery X Date Version
				dateV: '1.0',

				/**
				 * 时间控件
				 * @param	object	prop	参数
				 * @return	object
				 */
				date: function(prop){
					var a24, a60, today,
						config		= {
							valin	: '',			//input值存储器,当前或find(valin)
							now		: false,		//即时记录
							html	: '<div class="c_x_date"><div class="cb"></div><dl><dt><p></p></dt><dt><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span><span>日</span></dt><dd></dd></dl><div class="hm fix"><label>选择时间:</label><div class="hour"><span></span><p></p></div><em>点</em><div class="minute"><span></span><p></p></div><em>分</em></div><div class="smt"><a href="javascript:;" class="c_x_green_25 sure"><span>确定</span></a><a href="javascript:;" class="c_x_gray_25 cancel"><span>取消</span></a></div><a href="javascript:;" class="prev"></a><a href="javascript:;" class="next"></a><i></i></div>',			//结构
							ym		: 'dl dt p',	//年月选择器
							days	: 'dl dd',		//日期选择器
							dtag	: 'span',		//日期标签,默认span
							hour	: '.hour',		//时下拉选择器
							minute	: '.minute',	//分下拉选择器
							prev	: '.prev',		//前一个月
							next	: '.next',		//后一个月
							sure	: '.sure',		//确定按钮选择器,如为空则选择值即时记录
							cancel	: '.cancel',	//取消按钮选择器
							start	: null,			//设定开始日期
							end		: null,			//设定结束日期
							begin	: 1,			//0周日,1周一
							hm		: 1,			//是否只显示日历
							disabled: [],			//禁止选择的日期,格式1999-9-9
							fn		: false			//选择回调
						},
						holidays	= {				//节日
							'0101'	:	'元旦',
							'0214'	:	'情人',
							'0308'	:	'妇女',
							'0401'	:	'愚人',
							'0501'	:	'劳动',
							'0504'	:	'青年',
							'0601'	:	'儿童',
							'0701'	:	'党生',
							'0801'	:	'建军',
							'0910'	:	'教师',
							'1001'	:	'国庆',
							'1101'	:	'万圣',
							'1225'	:	'圣诞',
							'2000'	:	{'0205': '春节', '0219': '元宵', '0404': '清明', '0606': '端午', '0806': '七夕', '0912': '中秋', '1006': '重阳', '1221': '冬至', '0114': '腊八', '0129': '小年', '0204': '除夕'},
							'2001'	:	{'0124': '春节', '0207': '元宵', '0405': '清明', '0625': '端午', '0825': '七夕', '1001': '中秋', '1025': '重阳', '1222': '冬至', '0102': '腊八', '0117': '小年', '0123': '除夕'},
							'2002'	:	{'0212': '春节', '0226': '元宵', '0405': '清明', '0615': '端午', '0815': '七夕', '0921': '中秋', '1014': '重阳', '1222': '冬至', '0120': '腊八', '0204': '小年', '0211': '除夕'},
							'2003'	:	{'0201': '春节', '0215': '元宵', '0405': '清明', '0604': '端午', '0804': '七夕', '0911': '中秋', '1004': '重阳', '1222': '冬至', '0110': '腊八', '0125': '小年', '1230': '腊八'},
							'2004'	:	{'0122': '春节', '0205': '元宵', '0404': '清明', '0622': '端午', '0822': '七夕', '0928': '中秋', '1022': '重阳', '1221': '冬至', '0114': '小年', '0121': '除夕'},
							'2005'	:	{'0209': '春节', '0223': '元宵', '0405': '清明', '0611': '端午', '0811': '七夕', '0918': '中秋', '1011': '重阳', '1222': '冬至', '0117': '腊八', '0201': '小年', '0208': '除夕'},
							'2006'	:	{'0129': '春节', '0212': '元宵', '0405': '清明', '0531': '端午', '0731': '七夕', '1006': '中秋', '1030': '重阳', '1222': '冬至', '0107': '腊八', '0122': '小年', '0128': '除夕'},
							'2007'	:	{'0218': '春节', '0304': '元宵', '0405': '清明', '0619': '端午', '0819': '七夕', '0925': '中秋', '1019': '重阳', '1222': '冬至', '0126': '腊八', '0210': '小年', '0217': '除夕'},
							'2008'	:	{'0207': '春节', '0221': '元宵', '0404': '清明', '0608': '端午', '0807': '七夕', '0914': '中秋', '1007': '重阳', '1221': '冬至', '0115': '腊八', '0130': '小年', '0206': '除夕'},
							'2009'	:	{'0126': '春节', '0209': '元宵', '0404': '清明', '0528': '端午', '0826': '七夕', '1003': '中秋', '1026': '重阳', '1222': '冬至', '0103': '腊八', '0118': '小年', '0125': '除夕'},
							'2010'	:	{'0214': '春节', '0228': '元宵', '0405': '清明', '0616': '端午', '0816': '七夕', '0922': '中秋', '1016': '重阳', '1222': '冬至', '0122': '腊八', '0206': '小年', '0213': '除夕'},
							'2011'	:	{'0203': '春节', '0217': '元宵', '0405': '清明', '0606': '端午', '0806': '七夕', '0912': '中秋', '1005': '重阳', '1222': '冬至', '0111': '腊八', '0126': '小年', '0202': '除夕'},
							'2012'	:	{'0123': '春节', '0206': '元宵', '0404': '清明', '0623': '端午', '0823': '七夕', '0930': '中秋', '1023': '重阳', '1221': '冬至', '0101': '腊八', '0116': '小年', '0122': '除夕'},
							'2013'	:	{'0210': '春节', '0224': '元宵', '0404': '清明', '0612': '端午', '0813': '七夕', '0919': '中秋', '1013': '重阳', '1222': '冬至', '0119': '腊八', '0203': '小年', '0209': '除夕'},
							'2014'	:	{'0131': '春节', '0214': '元宵', '0405': '清明', '0602': '端午', '0802': '七夕', '0908': '中秋', '1002': '重阳', '1222': '冬至', '0108': '腊八', '0123': '小年', '0130': '除夕'},
							'2015'	:	{'0219': '春节', '0305': '元宵', '0405': '清明', '0620': '端午', '0820': '七夕', '0927': '中秋', '1021': '重阳', '1222': '冬至', '0127': '腊八', '0211': '小年', '0218': '除夕'},
							'2016'	:	{'0208': '春节', '0222': '元宵', '0404': '清明', '0609': '端午', '0809': '七夕', '0915': '中秋', '1009': '重阳', '1221': '冬至', '0117': '腊八', '0201': '小年', '0207': '除夕'},
							'2017'	:	{'0128': '春节', '0211': '元宵', '0404': '清明', '0530': '端午', '0828': '七夕', '1004': '中秋', '1028': '重阳', '1222': '冬至', '0105': '腊八', '0120': '小年', '0127': '除夕'},
							'2018'	:	{'0216': '春节', '0302': '元宵', '0405': '清明', '0618': '端午', '0817': '七夕', '0924': '中秋', '1017': '重阳', '1222': '冬至', '0124': '腊八', '0208': '小年', '0215': '除夕'},
							'2019'	:	{'0205': '春节', '0219': '元宵', '0405': '清明', '0607': '端午', '0807': '七夕', '0913': '中秋', '1007': '重阳', '1222': '冬至', '0113': '腊八', '0128': '小年', '0204': '除夕'},
							'2020'	:	{'0125': '春节', '0208': '元宵', '0404': '清明', '0625': '端午', '0825': '七夕', '1001': '中秋', '1025': '重阳', '1221': '冬至', '0102': '腊八', '0117': '小年', '0124': '除夕'}
						},
						today		= _days();		//今天

					//重置参数
					$.extend(config, prop);

					//时,分html
					for(var i = 0; i < 60; i++){
						a60 = (a60 || '') + '<a href="javascript:;">' + _zero(i) + '</a>';
						i === 23 && (a24 = a60);
					}

					return this.each(function(){
						var defday,					//默认
							$this = $(this),
							valin	= config.valin ? $this.find(config.valin) : $this,
							start	= typeof config.start === 'function' ? _days(null, null, config.start.call(this).replace(/-/ig, '/')) : config.start,
							end		= typeof config.end === 'function' ? _days(null, null, config.end.call(this).replace(/-/ig, '/')) : config.end;
						$this.on('click focus', function(e){
							var tomonth	= {},
								sltday	= {},
								offset	= $this.offset(),
								defval	= valin.val().replace(/-/ig, '/');
							defval && (defday = _days(start, end, defval));
							$.pop({
								html		: config.html,
								id			: 'jq_x_date',
								bg			: false,
								position	: 'absolute',
								left		: offset.left + $this.width() / 2,
								top			: offset.top + $this.height() + 10,
								fn			: function(){
									var __month,
										$$this	= $(this),
										ym		= $$this.find(config.ym),
										days	= $$this.find(config.days),
										sh		= $$this.find(config.hour + ' span'),
										sm		= $$this.find(config.minute + ' span'),
										today	= _days(start, end);
									if(!config.hm)$$this.find('.hm').remove();
									$$this.find(config.hour + ' p').html(a24);
									$$this.find(config.minute + ' p').html(a60);
									$$this.find(config.hour + ',' + config.minute).selects({parent : this, onA: 'on', fnA: function(){
										var $$$this = $(this),
											text	= + $$$this.text(),
											hm		= $$$this.parents('p').parent('div').hasClass('hour') ? 'hour' : 'minute';
										tomonth[hm] = text;
										sltday[hm] = text;
										(!config.sure || config.now) && (config.fn || Fn).call(valin.val(_format(sltday, '-')).get(0));
									}});
									(__month = function(initday, slt){
										ym.html(initday.year + '年&nbsp;' + initday.month + '月');
										days.html(initday.days);
										sh.text(_zero(initday.hour));
										sm.text(_zero(initday.minute));
										$.extend(tomonth, initday);
										slt && $.extend(sltday, tomonth);
									})(defday || today, true);
									$$this.css({marginLeft: - $$this.width() / 2}).on('click', config.days + ' ' + config.dtag + '.m', function(){
										var $$$this	= $(this).addClass('on');
										$$$this.siblings().removeClass('on');
										tomonth.day = + $$$this.attr('_day');
										$.extend(sltday, tomonth);
										(!config.sure || config.now) && (config.fn || Fn).call(valin.val(_format(sltday, '-')).get(0));
									}).on('click', config.prev, function(){
										tomonth.month - 1 <= 0 ? (tomonth.month = 12, tomonth.year--) : tomonth.month--;
										__month(_days(start, end, _format(tomonth), sltday));
									}).on('click', config.next, function(){
										tomonth.month + 1 > 12 ? (tomonth.month = 1, tomonth.year++) : tomonth.month++;
										__month(_days(start, end, _format(tomonth), sltday));
									}).on('click', config.cancel, function(){
										$$this.remove();
									});
									config.sure && $$this.on('click', config.sure, function(){
										(config.fn || Fn).call(valin.val(_format(sltday, '-')).get(0));
										$$this.remove();
									});
								}
							});
							e.stopPropagation();
						});
					});

					//根据要求格式返回当前月html
					function _days(start, end, str, sltd){
						var year, month, day, days, vacant, cn, ii,
							html	= '',
							date	= _date(str);
						if(!date)return false;
						year	= date.getFullYear(),
						month	= date.getMonth() + 1,
						day		= date.getDate(),
						hour	= date.getHours(),
						minute	= date.getMinutes(),
						vacant	= date.getDay() - day % 7 + 1 - config.begin,
						days	= _mdays(year, month);
						for(var i = 0, len = (vacant < 0 ? 7 : 0) + vacant; i < len; i++)html += '<' + config.dtag + '></' + config.dtag + '>';
						for(var i = 0; i < days; i++){
							cn = __check((ii = i + 1));
							html += '<' + config.dtag + ((start && (start.year > year || (start.year === year && (start.month > month || (start.month === month && (start.day >= ii)))))) || (end && (end.year < year || (end.year === year && (end.month < month || (end.month === month && (end.day <= ii)))))) || _disabled(year + '-' + month + '-' + ii) ? '' : ' class="m'+ ((sltd ? year == sltd.year && month == sltd.month && ii === sltd.day : ii == day)  ? ' on' : '') + '"') + ' _day="' + ii + '">' + cn + '</' + config.dtag + '>';
						}
						return {
							year	: year,
							month	: month,
							day		: day,
							hour	: hour,
							minute	: minute,
							days	: html
						}
						function __check(j){
							var md		= _zero(month) + _zero(j),
								holiday	= holidays[md] || (holidays[year] && holidays[year][md]);
							return today && year == today.year && month == today.month && j === today.day ? '今天' : holiday || j;
						}
					}

					//是否禁用
					function _disabled(text){
						return $.inArray(text, config.disabled) < 0 ? 0 : 1;
					}

					//计算当前月天数
					function _mdays(y, m){
						return m === 2 ? y % 4 ? 28 : 29 : m > 7 ? m % 2 ? 30 : 31 : m % 2 ? 31 : 30;
					}

					//获取时间对象
					function _date(str){
						var date = str ? new Date(str) : new Date();
						if(date === 'Invalid Date')return false;
						return date;
					}

					//格式化'1970/01/01 00:00'
					function _format(d, tag){
						return d.year + (tag || '/') + _zero(d.month) + (tag || '/') + _zero(d.day) + ' ' + (config.hm ? _zero(d.hour) + ':' + _zero(d.minute) : '');
					}

					//自动补零
					function _zero(n){
						return (n < 10 ? '0' : '') + (+ n);
					}

				}

			});

			return $;
		},
		document	= window.document,
		navigator	= window.navigator,
		jQuery		= window.jQuery,
		define		= window.define;

		jQuery && jQuery().x && jQueryXDate(jQuery);
		typeof define === 'function' && define.amd && define(['jquery'], jQueryXDate);

})(window);