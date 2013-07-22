#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create(title: 'CoffeeScript',
  description: 
    "<p>
        <em>Rails Test Prescriptions</em>CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>",
  image_url:   'cs.jpg',    
  price: 36.00)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95)
# . . .

=begin
Product.create(title: 'Rails Test Prescriptions',
  description: 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  image_url: 'rtp.jpg',
  price: 34.95)
  
Product.create(title: '三国演义',
  description: 
    %{<p>
                      全称《三国志通俗演义》，是中国小说史上长篇章回小说的开山之作。小说以公元184至280年间自黄巾起义至西晋统一的历史故事为素材，
                      用规模宏大的结构和虚实结合的手法，集中描写了魏、蜀、吴三国统治集团之间政治、军事、外交的种种斗争。生动地揭示了统治阶级内部尔虞我诈的勾结与你死我活的斗争的同时，
                      也塑造了一批或智、或忠、或义的生动形象。
      </p>},
  genre:  'literature',
  image_url: '3k.png',
  price: 45)
  
Product.create(title: '美联储',
  description: 
    %{<p>
                      《美联储》内容简介：美联储是私人的？美联储是政府的？深入资本的神殿，外科手术式剖析经济大势真正的操纵者——美联储。美联储是一个怪胎，它是国家政府的一部分，
                      却又小心翼翼地置于选举程序之外，同时又与纯粹的政治权力完全绝缘。这使它成为缓解“民主”与“资本主义”之间本质对立的机构，换言之，它是华盛顿与华尔街之间的旋转门。
                      作为资本的政治代言和监管者，美联储决定了谁将贫穷，谁将富有。 比格林斯潘更伟大的银行家——保罗•沃尔克，一个奠定其一生地位的惊心动魄的改革，至今仍让奥巴马追慕不已。 
        1978年末，美国通货膨胀愈演愈烈，借贷消费模式日益流行，扭曲的繁荣让人隐约看到了泡沫破灭的那一天。保罗﹒沃尔克在此期间走马上任美联储主席，传统的货币政策对高涨的通货膨胀有心无力，金融的改革不可避免。
                      美联储开始使用货币主义者开出的药方，货币供应急剧下降，利率不断攀升。通货膨胀在美联储的持续攻击之下，不断下降，终于回归正常。此一战，在金融史具有重要意义。 改革的代价谁来承受？民主与资本如何两权，在史诗级的恢弘壮阔中品味民主的细节。
                       持续的高利率，让实业和银行遭遇悲喜两重天。一边是日益困顿的“美国的肌肉”——劳工阶级，一边是坐收渔利的银行家，然而这种现象却被经济的掌门人认为是公平的。经济萧条日益严重，民选的总统和议员们不断给美联储主席施压，迫使后者尽早结束通货紧缩的状态。
                       美联储主席表现出“经济沙皇”的一面，他丝毫不为所动，固执地封死美国经济的油门。债权人成为改革真正的受益者，而绝大多数的美国“穷人”成为被牺牲的对象。 华尔街的金融资本如何运作？白宫的政客奉行什么信条？货币到底怎样影响每一个人。
                       一本经典却通俗的著作，让你可以轻松学会真实世界的经济学。 华尔街的金融大佬，是不是普通人的敌人？他们遵循什么样的金融动力学？为什么说货币是一个神秘的心理操纵术，每个人都深受它的影响？央行通过什么方式影响全国经济系统，美联储为何能够执全球经济的牛耳？
                       政府机构遵守什么原则与资本市场角力。一本让您看懂真实世界的经济学如何运行的书。
      </p>},
  genre:  'economy',
  image_url: 'eco1.png',
  price: 59.4)
  
Product.create(title: '生活周刊',
  description: 
    %{<p>
                     三联生活周刊(2013年第28期) [平装]。
      </p>},
  genre:  'life',
  image_url: 'life1.png',
  price: 9.5)
  
Product.create(title: '小猪唏哩呼噜',
  description: 
    %{<p>
                     《小猪唏哩呼噜(彩色注音版)(套装上下册)》内容简介：小猪唏哩呼噜是十二胞胎姐弟中最小的一个，也是唯一的男骇，因为他吃东西的时候特别的响，总是头也不抬地“唏哩呼噜、唏哩呼噜”，
                     所以爸爸妈妈就叫他唏哩呼噜。小猪唏哩呼噜是一只不平凡的小猪，唏哩呼噜被大狼叼走，要去喂小狼宝宝，可是他并没有怕，而是巧妙地逃脱了大狼的手心，还在八哥“你好再见”的帮助下战胜了要吃掉小狼们的月牙熊，
                     成功地保护了小狼们。他为鸭太太做保镖、一个人赶夜路到城里送鸭蛋；还帮鸡太太鸡宅捉鬼……只是谁也不能只遇到好事情，碰不着坏事情，小猪唏哩呼噜也遇到了各种各样的麻烦事，因为他毕竟还只是一只小小猪，
                     太单纯也太善良，一些自以为聪明的家伙总是想欺侮它，打他的主意，想占便宜，像狐狸掌柜的说话不算数、象博士的“咬文嚼字”都使小猪唏哩呼噜受了不少的冤枉气，也吃了好多的苦。可是天性乐观开朗的小猪唏哩呼噜却不在乎这些。
                     因为他是那只著名的小猪啊。 《小猪唏哩呼噜(彩色注音版)(套装上下册)》图文作者是我国第一位获国际安徒生奖提名的作家和画家。
      </p>},
  genre:  'children',
  image_url: 'child.png',
  price: 9.5)
=end