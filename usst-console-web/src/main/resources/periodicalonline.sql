/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : periodicalonline

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-06-07 15:36:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for usst_document
-- ----------------------------
DROP TABLE IF EXISTS `usst_document`;
CREATE TABLE `usst_document` (
  `id` varchar(32) NOT NULL COMMENT '稿件编号',
  `userId` varchar(32) DEFAULT NULL COMMENT '评审员Id',
  `articleAuthor` varchar(255) DEFAULT NULL COMMENT '作者',
  `articleTitle` varchar(32) DEFAULT NULL COMMENT '稿件标题',
  `articleType` varchar(32) DEFAULT NULL COMMENT '文章类型',
  `articleKey` varchar(32) DEFAULT NULL COMMENT '关键词',
  `articleDigest` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `articleContent` longtext COMMENT '文章正文',
  `isDrafts` varchar(1) DEFAULT NULL COMMENT '草稿（0：否，1：是）',
  `articleStatus` varchar(16) DEFAULT NULL COMMENT '稿件状态（auditing:审核中，published:审核通过，rejected:拒绝）',
  `auditorId` varchar(32) DEFAULT NULL COMMENT '审核人Id',
  `auditorOpinion` varchar(255) DEFAULT NULL COMMENT '审稿人意见',
  `isAudit` varchar(1) DEFAULT NULL COMMENT '是否被审核过（0：未审核，1：已审核）',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) DEFAULT NULL,
  `lstUpdateOn` varchar(32) DEFAULT NULL,
  `lstUpdateBy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_document
-- ----------------------------
INSERT INTO `usst_document` VALUES ('06e2c77d7d8d4fbeb0b3a4731c39063a', '8529f32239a74ac9afeffe4b933fc0af', '小明', '浅谈网站服务器安全维护技巧', '007', '网络，服务器，病毒', '服务器的维护至关重要，稍有闪失即会使整个网络陷入瘫痪。', '<p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　服务器的维护至关重要，稍有闪失即会使整个<a href=\"http://www.lunwendata.com/thesis/List_129.html\" title=\"网络论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">网络</a>陷入瘫痪。目前，恶意的<a href=\"http://www.lunwendata.com/thesis/List_129.html\" title=\"网络论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">网络</a>攻击行为包括两类：一是恶意的攻击行为，如拒绝服务攻击、网络病毒等，这些行为消耗大量的服务器资源，影响服务器的运行速度和正常工作，甚至使服务器所在的网络瘫痪；另外一类是恶意的入侵行为，这种行为会导致服务器敏感信息泄露，入侵者更是可以为所欲为，肆意破坏服务器。要保障网络服务器的安全就要尽量使网络服务器避免受这两种行为的影响。本文以基于Windows2003操作系统的服务器为例，介绍一些网站服务器安全维护的技巧。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　1.转换角色，模拟可能的攻击</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　多数时候，我们若只是站在网站维护员的位置上思考问题，可能很难发觉网站服务器的漏洞。相反，维护员若能换个角度，把自身当作可能的攻击者，从他们的角色出发，揣测他们可能会运用哪些手段对哪些网站服务器的漏洞进行攻击，或许就可以发现网站服务器可能存在的安全漏洞，从而先行一步，修补漏洞，避免被木马或者病毒攻击，防患于未然。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　从外网访问自身的网站服务器，执行完整的检测，然后模拟攻击者攻击自身的站点，看会有什么结果。这对于网站的安全性来说，无疑是一种很好的检测方法。自己充当攻击者，运用适当的扫描工具对网站服务器执行扫描，有些东西日常可能不会引起重视，但是运用黑客常用的工具执行扫描，就会发觉一些可能会被他们调用的服务或者漏洞。如在网站服务器安装的时候，操作系统会默认安装并启动一些不需要的服务，或者在服务器配置的时候，需要启动一些服务，但是事后没有及时关上，从而给不法攻击者留下攻击的机会。常见的如SNMP服务（基本网络维护协议），这个服务在系统安装完毕后默认是开启的。但是，这个服务可以为攻击者提供服务器系统的详细信息，如网站服务器采用了什么操作系统，开启了什么服务与对应的端口等重要信息，攻击者只要清楚这些基本的信息就能开展攻击。安全维护人员在日常工作中可能不会发觉这个问题，若借助黑客的扫描工具，就能发现问题所在。因此，在必要的时候可以换个角度，从攻击者的角度出发，猜测他们会采用什么攻击手段，防止出现当局者迷的情况。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　2.合理的权限维护</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　大多时候，一台服务器不仅运行了网站的<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"应用论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">应用</a>，而且还会运行诸如FTP服务器和流媒体服务器之类的网络服务。在同一台服务器上使用多种网络服务很可能造成服务之间的相互感染。也就是说，攻击者只要攻击一种服务，就可以运用相关的技能攻陷其他使用。因为攻击者只需要攻破其中一种服务，就可以运用这个服务平台从内部攻击其他服务，通常来说，从内部执行攻击要比外部执行攻击方便得多。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　或许有人会说，不同的服务采用不同服务器就可以了。当然可以，但这样浪费很大，因为从性能上讲，在服务器上同时部署Web服务与FTP服务及流媒体服务的话，是完全可行的。为此，从成本考虑，我们使用一个服务器同时运行三种服务：一个是传统的网站服务；二是FTP服务；三是流媒体服务，因为该服务是mms模式的，<a href=\"http://www.buhui.com/internet/\" title=\"互联网\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">互联网</a>上也可以直接访问流媒体服务器，所以也就部署同一台服务器上。由于选用的服务器配置比较高，所以，运行这三个服务没有太大问题，性能也不会受到影响。但是这给网站安全维护者出了一个难题：两种、甚至两种以上的服务同时部署在一台服务器上，怎么才能保障安全、防止彼此相互感染呢？</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　通常采用的文件系统是FAT或者FAT32。NTFS是微软WindowsNT内核的系列操作系统支持的、一个特别为网络和磁盘配额、文件加密等<a href=\"http://www.lunwendata.com/thesis/List_4.html\" title=\"管理论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">管理</a>安全特性设计的磁盘格式。在NTFS文件系统里可以为任何一个磁盘分区单独设置访问权限，把敏感信息和服务信息分别放在不同的磁盘分区。这样，即使黑客通过某些方法获得服务文件所在磁盘分区的访问权限，还需要想方设法突破系统的安全设置才能进一步访问保存在其他磁盘上的敏感信息。我们采用Windows2003服务器，为了实现这个安全需求，把服务器中所有的硬盘都转换为NTFS分区。通常来说，NTFS分区比FAT分区安全性高很多。运用NTFS分区自带的功能，合理为它们分配相关的权限。如为这三个服务配置不同的维护员账户，不同的账户只能对特定的分区与目录执行访问。如此一来，即使某个维护员账户失窃，<a href=\"http://www.tianxialunwen.com/\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">天下论文网</a>攻击者也只能访问某个服务的存储空间，而不能访问其他服务的。例如把网站服务装在分区D，而把FTP服务放在分区E。若FTP的账户信息泄露而被攻击，但是因为FTP账户没有对分区D具有读写的权利，所以，不会对网站服务器上的内容执行任何的读写操作。这样可以保障即使黑客攻陷FTP服务器后，也不会对网站服务器产生不良的影响。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　此外，依员工上班时间来限定使用者登录网络的权限也是一个不错的方法。例如，上白天班的员工不该有权限在三更半夜登录网络。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　3.脚本安全维护</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　实际工作中，许多网站服务器因为被攻击而瘫痪都是由于不良的脚本造成的。攻击者特别喜欢针对CGI程序或者PHP脚本实施攻击。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　通常来说，使用网站需要传递一些必要的参数，才能够正常访问。这个参数可以分为两类，一个是值得信任的参数，另外一类是不值得信任的参数。某单位是自身维护网站服务器，而不是托管，把服务器放置在单位防火墙内部，以提高网站服务器的安全性。所以一般来说，来自防火墙内部的参数都是可靠的，值得信任的，而来自外部的参数基本上是不值得信任的。但是，并不是说不值得信任的参数或者来自防火墙外部的参数网站服务器都不采用，而是说，在网站服务器设计的时候，需要格外留心，采用这些不值得信任的参数的时候需要执行检验，看其是否正当，而不能向来自网站内部的参数那样照收不误。这会给网站服务器的安全带来隐患，例如，攻击者运用TELNET连接到80端口，就可以向CGL脚本传递不安全的参数。所以，在CGI程序编写或者PHP脚本编辑的时候，我们要留心，不能让其随便接受陌生人的参数。在接受参数之前，要先检验提供参数的人或者参数本身的正当性。在程序或者脚本编写的时候，可以预先参加一些判断条件。当服务器认为提供的参数不准确的时候，及时通知维护员。这也可以帮助我们尽早发觉可能存在的攻击者，并及时采取相应的防御措施。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　4.做好系统备份</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　常言道，“有备无患”，虽然大家都不希望系统突然遭到破坏，但是做好准备是必须的。作好服务器系统备份，万一遭破坏的时候也可以及时恢复。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　5.安装<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"软件论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">软件</a>防火墙、杀毒<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"软件论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">软件</a></p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　虽然我们已经有了一套硬件的防御系统，但是多一些保障会更好。关于防火墙、杀毒软件的论述已经很多，这里不再赘述。</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　6.开启事件日志</p><p style=\"margin-top: 0px; margin-bottom: 10px; font-size: 14px; white-space: normal; padding: 0px; font-family: 宋体, helvetica, Arial; line-height: 26px; background-color: rgb(245, 250, 255);\">　　开启日志服务虽然对阻止黑客的入侵并没有直接的作用，但是它可以记录黑客的行踪，维护员可以分析入侵者在系统上做过什么手脚，在系统上留了哪些后门，给系统造成了哪些破坏及隐患，服务器到底还存在哪些安全漏洞等，以便有针对性地实施维护。</p><p style=\"white-space: normal;\"><br/></p><p><br/></p>', '0', 'AUDITING', '5cf913b29c474ff5bf1bbd67bdc2d027', null, '0', '1', '2016/05/25 20:50:43', '小明', '2016/05/25 23:11:40', 'admin');
INSERT INTO `usst_document` VALUES ('4d529823ddcf406bb27e192d1a91e0e9', '8529f32239a74ac9afeffe4b933fc0af', '小明', '浅谈计算机网络中服务的概念', '007', '计算机；网络；服务。', '由系统管理员管理的结构化计算机环境和只有一台或几台孤立计算机组成的计算机环境的主要区别是服务。针对计算机网络中的服务概念进行了阐述。', '<p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">由系统管理员管理的结构化计算机环境和只有一台或几台孤立计算机组成的计算机环境的主要区别是服务。这种只有几台孤立计算机的典型环境是家庭和那些很小的非技术性的办公室，而典型的结构化计算机环境则是由技术人员操作大量的计算机，通过共享方便的通信、优化的资源等服务来互相联结在一起。当一台家用电脑通过<a href=\"http://www.buhui.com/internet/\" title=\"互联网\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">互联网</a>或通过ISP 连接到因特网上， 他就是使用了ISP 或其他人提供的服务才进入网络的。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　提供一个服务绝不仅仅是简单的把硬件和<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"软件论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">软件</a>累加在一起，它包括了服务的可靠性、服务的标准化、以及对服务的监控、维护、技术支持等。只有在这几个方面都符合要求的服务才是真正的服务。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　1 服务的基本问题。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　创建一个稳定、可靠的服务是一个系统管理员的重要工作。在进行这项工作时系统管理员必须考虑许多基本要素，其中最重要的就是在设计和开发的各个阶段都要考虑到用户的需求。要和用户进行交流， 去发现用户对服务的要求和预期，然后把其它的要求如管理要求等列一个清单，这样的清单只能让系统管理员团队的人看到。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　服务应该建立在服务器级的机器上而且机器应该放在合适的环境中，作为服务器的机器应当具备适当的可靠性。服务和服务所依赖的机器应该受到监控，一旦发生故障就发出警报或产生故障记录清单。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　作为服务一部分的机器和<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"软件论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">软件</a>应当依赖那些建立在相同或更高标准上的主机和软件，一个服务的可靠性和它所依赖的服务链中最薄弱环节的可靠性是相当的。一个服务不应该无故的去依赖那些不是服务一部分的主机。一旦服务建好并完成了测试， 就要逐渐转到用户的角度来进行进一步的测试和调试。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　1.1 用户的要求。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　建立一个新服务应该从用户的要求开始，用户才是你建立服务的根本原因。如果建立的服务不合乎用户的需要，那就是在浪费精力。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　搜集用户的需求应该包括下面这些内容：他们想怎样使用这些新服务、需要哪些功能、喜欢哪些功能、这些服务对他们有多重要，以及对于这些服务他们需要什么级别的可用性和技术支持。如果可能的话，让用户试用一下服务的试用版本。不要让用户使用那些很麻烦或是不成功的系统和项目。尽量计算出使用这个服务的用户群有多大以及他们需要和希望获得什么样的性能，这样才能正确的计算。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　1.2 操作上的要求。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　对于系统管理员来说， 新服务的有些要求不是用户直接可见的。比如系统管理员要考虑到新服务的管理界面、是否可以与已有的服务协同操作，以及新服务是否能与核心服务如认证服务和目录服务等集成到一起。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　从用户期望的可靠性水平以及系统管理员们对系统将来要求的可靠性的预期，系统管理员们就能建立一个用户期望的功能列表，其内容包括群集、从属设备、备份服务器或具有高可用性的硬件和操作系统。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　1.3 开放的体系结构。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　有时销售商使用私有协议就是为了和别的销售商达成明确的许可协议，但是会在一个销售商使用的新版本和另一个销售商使用的兼容版本之间存在明显的延迟，两个销售商所用的版本之间也会有中断，而且没有提供两个产品之间的接口。这种情况对于那些依靠它们的接口同时使用两种产品的人来说，简直是一场恶梦。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　一个好的解决方法就是选择基于开放标准的协议，让双方都能选择自己的软件。这就把用户端<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"应用论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">应用</a>程序的选择同服务器平台的选择过程分离了，用户自由的选择最符合自己需要、偏好甚至是平台的软件，系统管理员们也可以独立地选择基于他们的可靠性、规模可设定性和可管理性需要的服务器解决方案。系统管理员们可以在一些相互竞争的服务器产品中进行选择，而不必被囿于那些适合某些用户端<a href=\"http://www.lunwendata.com/thesis/List_127.html\" title=\"应用论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">应用</a>程序的服务器软件和平台。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　在许多情况下， 如果软件销售商支持多硬件平台，系统管理员们甚至可以独立地选择服务器硬件和软件。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　我们把这叫做用户选择和服务器选择分离的能力。开放协议提供了一个公平竞争的场所，并激起销售商之间的竞争，这最终会使我们受益。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　开放协议和文件格式是相当稳定的， 不会经常改动（即使改动也是向上兼容的），而且还有广泛的支持，能给你最大的产品自主选择性和最大的机会获得可靠的、兼容性好的产品。[<a href=\"http://www.lunwendata.com/\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">论文网</a><a href=\"http://www.lunwendata.com/\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">Www.LunWenData.Com</a>]</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　2 其它需要考虑的问题。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　建立一个服务除了要求可靠、可监测、易维护支持，以及要符合所有的我们基本要求和用户的要求外，还要考虑到一些特别的事情。如果可能的话，应该让每个服务使用专门的机器，这么作可以让服务更容易得到支持和维护，也能减少忘记一些服务器机器上的小的服务的机会。在一些大<a href=\"http://www.lunwendata.com/thesis/List_44.html\" title=\"公司论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">公司</a>，使用专门的机器是一条基本原则， 而在小<a href=\"http://www.lunwendata.com/thesis/List_44.html\" title=\"公司论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">公司</a>，由于成本问题，一般达不到这个要求。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　还有一个观念就是在建立服务时要以让服务完全冗余为目标。有些重要的服务不管在多大的公司都要求完全冗余。由于公司的规模还会增长，所有你要让所有的服务都完全冗余为目标。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　2.1 使用专门的机器。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　理想的情况，服务应该建立在专门的机器上。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　大网站应该有能力根据服务的要求来调整到这个结构，而小网站却很难做到。每个服务都有专门的机器会使服务更可靠，当发生可靠性问题是也容易调试，发生故障的范围更小，以及容易升级和进行容量计划。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　从小公司成长起来的大网站一般有一个集中管理的机器作为所有重要服务的核心，这台机器提供名字服务、认证服务、打印服务、邮件服务等等。最后，由于负荷的增长，机器不得不分开，把服务扩展到别的服务器上去。常常是在这之前，系统管理员们已经得到了资金，可以买更多的管理用的机器，但是觉得太麻烦，因为有这么多的服务依赖这机器，把它们都分开太难了。当把服务从一台机器上分开时，IP 地址的依赖最难处理了， 有些服务如名字服务的IP 地址都在用户那里都已经记得很牢固了，还有一些IP 地址被安全系统如路由器、防火墙等使用。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　把一个中心主机分解到许多不同的主机上是非常困难的，建立起来的时间越长，上面的服务越多，就越难分解。使用基于服务的名字会有所帮助，但是必须整个公司都使用标准化的、统一的、始终如一的名字。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　2.2 充分的冗余。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　充分的冗余是指有一个或一系列复制好的服务器， 能在发生故障的时候接管主要的故障设备。冗余系统应该可以作为备份服务器连续的运行，当主服务器发生故障时能自动连上线，或者只要少量的人工干预， 就能接管提供服务的故障系统。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　你选择的这类冗余是依赖于服务的。有些服务如网页服务器和计算区域，可以让自己很好的在克隆好的机器上运行。别的服务比如大数据库就不行，它们要求连接更牢固的崩溃恢复系统。你正在使用的用来提供服务的软件或许会告诉你，冗余是以一种有效的、被动的、从服务器的形式存在的，只有在主服务器发生故障并发出请求时，冗余系统才会响应。不管什么情况，冗余机制必须要确保数据同步并保持数据的完整。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　如果冗余服务器连续的和主服务器同步运行，那么冗余服务器就可以用来分担正在正常运行的负荷并能提高性能。如果你使用这种方法，一定要注意不要让负荷超出性能不能接受的临界点，以防止某个服务器出现故障。在到达临界点之前要为现存系统增加更多的并行服务器。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　冗余的另一个好处就是容易升级。可以进行滚动升级。每次有一台主机被断开、升级、测试然后重新开始服务。单一主机的故障不会停止整个服务，虽然可能会影响性能。如果你真的搞杂了一个升级那就关掉电源等你冷静下来再去修它。</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　参考文献：</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　[1]莫卫东。计算机网络技术及应用[M].北京：机械工业出版社，2009,4.</p><p style=\"margin-top: 0px; margin-bottom: 10px; padding: 0px; font-family: 宋体, helvetica, Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(245, 250, 255);\">　　[2]吴怡。计算机网络配置、管理与应用[M].北京：高等<a href=\"http://www.lunwendata.com/thesis/List_15.html\" title=\"教育论文\" target=\"_blank\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">教育</a>出版社，2009,1.[<a href=\"http://www.lunwendata.com/\" style=\"color: rgb(68, 68, 68); text-decoration: none;\">论-文-网</a>]</p><p><br/></p>', '1', null, '5cf913b29c474ff5bf1bbd67bdc2d027', null, '0', '1', '2016/05/25 22:19:54', '小明', '2016/05/25 23:25:07', 'admin');
INSERT INTO `usst_document` VALUES ('471219728c2c467ea9d4a158febef55b', 'dc4282a4623c4493ba3f2793d738ac44', '321', '333', '002', '213', '321', '<p>369<br/></p>', '0', 'PUBLISH', '5cf913b29c474ff5bf1bbd67bdc2d027', 'vyuvjhkjvb', '1', '1', '2016/05/29 20:42:04', '321', '2016/05/29 20:45:53', 'admin');

-- ----------------------------
-- Table structure for usst_document_type
-- ----------------------------
DROP TABLE IF EXISTS `usst_document_type`;
CREATE TABLE `usst_document_type` (
  `id` varchar(32) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `order` int(3) DEFAULT NULL,
  `sum` int(32) unsigned zerofill DEFAULT NULL,
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) DEFAULT NULL,
  `lstUpdateOn` varchar(32) DEFAULT NULL,
  `lstUpdateBy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_document_type
-- ----------------------------
INSERT INTO `usst_document_type` VALUES ('001', '基础科学', '1', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('002', '工程科技', '2', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('003', '农业科技', '3', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('004', '医疗卫生', '4', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('005', '哲学与人文科学', '5', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('006', '社会科学', '6', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('007', '信息科技', '7', '00000000000000000000000000000000', '1', null, null, null, null);
INSERT INTO `usst_document_type` VALUES ('008', '经济与管理科学', '8', '00000000000000000000000000000000', '1', null, null, null, null);

-- ----------------------------
-- Table structure for usst_email
-- ----------------------------
DROP TABLE IF EXISTS `usst_email`;
CREATE TABLE `usst_email` (
  `id` varchar(32) NOT NULL,
  `sender` varchar(32) DEFAULT NULL COMMENT '发送人',
  `receiver` varchar(32) DEFAULT NULL COMMENT '收件人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '正文',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) DEFAULT NULL,
  `lstUpdateOn` varchar(32) DEFAULT NULL,
  `lstUpdateBy` varchar(32) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_email
-- ----------------------------
INSERT INTO `usst_email` VALUES ('26f13d71359d43779cbc7c871f0900d7', '13899997777@qq.com', '13899998888@163.com', 'd', 'd', '2', '2016/05/26 12:36:16', '小明', '2016/05/26 12:36:16', '小明');
INSERT INTO `usst_email` VALUES ('f9f45d64694d414690f838626ed7973e', '13899997777@qq.com', '13899998888@163.com', 'c', 'c', '2', '2016/05/26 12:36:37', '小明', '2016/05/26 12:36:37', '小明');
INSERT INTO `usst_email` VALUES ('ebfa97d63a884a2fb11ece2182c8b27d', '13899997777@qq.com', '13899998888@163.com', 'ww', 'ww', '0', '2016/05/26 12:37:39', '小明', '2016/05/26 12:37:39', '小明');
INSERT INTO `usst_email` VALUES ('89169fdba2b24c1488441ceff230777b', '13899997777@qq.com', '13899998888@163.com', 'f\'f', 'f\'f', '1', '2016/05/26 13:42:29', '小明', '2016/05/26 13:42:29', '小明');
INSERT INTO `usst_email` VALUES ('23be5b551f0d44c7b0d3fa341b747938', '13899997777@qq.com', '13899998888@163.com', 'GG', 'GG', '2', '2016/05/26 13:43:41', '小明', '2016/05/26 13:43:41', '小明');
INSERT INTO `usst_email` VALUES ('14d7126446ed4dd0b7c7049abef2e80d', 'admin@qq.com', '13899998888@163.com', '工作的评价', '工作很用心，继续努力！', '1', '2016/05/26 15:02:31', 'admin', '2016/05/26 15:02:31', 'admin');

-- ----------------------------
-- Table structure for usst_menu
-- ----------------------------
DROP TABLE IF EXISTS `usst_menu`;
CREATE TABLE `usst_menu` (
  `id` varchar(32) NOT NULL,
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色Id',
  `menuName` varchar(32) DEFAULT NULL COMMENT '名称',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父菜单',
  `level` varchar(1) DEFAULT NULL COMMENT '菜单级别（1：一级菜单,2:二级菜单）',
  `order` varchar(2) DEFAULT NULL COMMENT '排序',
  `menuUrl` varchar(255) DEFAULT NULL COMMENT '菜单Url',
  `menuIco` varchar(16) DEFAULT NULL COMMENT '菜单图标',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) DEFAULT NULL,
  `lstUpdateOn` varchar(32) DEFAULT NULL,
  `lstUpdateBy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_menu
-- ----------------------------
INSERT INTO `usst_menu` VALUES ('01', '000003', '文章管理', null, '1', '1', null, '&#xe687;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('02', '000003', '已发表', '01', '2', '1', '/author/publishedArticles.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('03', '000003', '草稿', '01', '2', '3', '/author/drafts.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('04', '000003', '邮件管理', null, '1', '2', null, '&#xe63b;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('05', '000003', '收件箱', '04', '2', '1', '/toReceiveEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('06', '000003', '已发送', '04', '2', '2', '/toSentEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('07', '000003', '已删除', '04', '2', '3', '/toDeleteEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('08', '000003', '个人中心', null, '1', '3', null, '&#xe62d;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('09', '000003', '个人信息', '08', '2', '1', '/information.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('10', '000003', '已提交', '01', '2', '2', '/author/auditingArticles.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('11', '000003', '修改密码', '08', '2', '2', '/toChangePsw.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('12', '000001', '文章管理', null, '1', '1', null, '&#xe687;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('13', '000001', '未审核', '12', '2', '1', '/manager/auditingArticle.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('14', '000001', '已发表', '12', '2', '2', '/manager/publishArticle.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('15', '000001', '评审管理', null, '1', '2', null, '&#xe6b3;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('16', '000001', '已审核', '15', '2', '1', '/manager/auditedArticle.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('17', '000001', '用户管理', null, '1', '3', null, '&#xe611;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('18', '000001', '审核员信息', '17', '2', '1', '/manager/getUsers?userType=000002', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('19', '000001', '个人信息', '35', '2', '1', '/information.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('20', '000001', '邮件管理', null, '1', '4', null, '&#xe63b;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('21', '000001', '收件箱', '20', '2', '1', '/toReceiveEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('22', '000001', '已发送', '20', '2', '2', '/toSentEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('23', '000001', '已删除', '20', '2', '3', '/toDeleteEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('24', '000001', '作者信息', '17', '2', '2', '/manager/getUsers?userType=000003', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('25', '000002', '评审管理', null, '1', '1', '', '&#xe6b3;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('26', '000002', '待审核', '25', '2', '1', '/auditor/unAudited.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('27', '000002', '已审核', '25', '2', '2', '/auditor/audited.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('28', '000002', '邮件管理', null, '1', '2', null, '&#xe63b;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('29', '000002', '收件箱', '28', '2', '1', '/toReceiveEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('30', '000002', '已发送', '28', '2', '2', '/toSentEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('31', '000002', '已删除', '28', '2', '3', '/toDeleteEmail.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('32', '000002', '个人中心', null, '1', '3', null, '&#xe62d;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('33', '000002', '个人信息', '32', '2', '1', '/information.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('34', '000002', '修改密码', '32', '2', '2', '/toChangePsw.htm', null, '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('35', '000001', '个人中心', null, '1', '5', null, '&#xe62d;', '1', null, null, null, null);
INSERT INTO `usst_menu` VALUES ('36', '000001', '修改密码', '35', '2', '2', '/toChangePsw.htm', null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for usst_user
-- ----------------------------
DROP TABLE IF EXISTS `usst_user`;
CREATE TABLE `usst_user` (
  `id` varchar(50) NOT NULL,
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `userName` varchar(32) DEFAULT NULL COMMENT '账号',
  `userPsw` varchar(50) DEFAULT NULL COMMENT '密码（加密后）',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `realName` varchar(32) DEFAULT NULL,
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '通讯地址',
  `resDirection` varchar(255) DEFAULT NULL COMMENT '研究方向',
  `company` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) DEFAULT NULL,
  `lstUpdateOn` varchar(32) DEFAULT NULL,
  `lstUpdateBy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_user
-- ----------------------------
INSERT INTO `usst_user` VALUES ('5628fcbc6bed4ad7831ede47ace3c794', '000001', 'admin', '96e79218965eb72c92a549dd5a330112', '1', 'admin', '13122898062', 'admin@qq.com', 'gggdegd', '', '', '1', '2016/04/02 17:26:40', 'system', '2016/04/02 17:26:40', 'system');
INSERT INTO `usst_user` VALUES ('8529f32239a74ac9afeffe4b933fc0af', '000003', 'xiaoming', '96e79218965eb72c92a549dd5a330112', '1', '小明', '13899997777', '13899997777@qq.com', '上海杨浦区军工路516号', 'javaweb开发', '百度', '1', '2016/05/25 18:17:20', 'system', '2016/05/25 18:17:20', 'system');
INSERT INTO `usst_user` VALUES ('5cf913b29c474ff5bf1bbd67bdc2d027', '000002', 'Linda', '96e79218965eb72c92a549dd5a330112', '0', '琳达', '13899998888', '13899998888@163.com', '上海杨浦区军工路516号', '计算机', '知网', '1', '2016/05/25 21:59:07', 'admin', '2016/05/25 21:59:07', 'admin');
INSERT INTO `usst_user` VALUES ('7384fc100c5a43c9a86198270db0bf62', '000002', 'Tom', '96e79218965eb72c92a549dd5a330112', '1', 'Tom', '13188888888', '13188888888@qq.com', '上海虹桥', '生物学', '上海生物研究所', '0', '2016/05/27 22:45:25', 'admin', '2016/05/27 22:45:25', 'admin');
INSERT INTO `usst_user` VALUES ('2b1ce8a79de84a5a9e1d9440c602bf51', '000002', 'Nancy', '2b69557714fd1e836641a3a11ecf7df7', '0', 'Nancy', '13166666666', '452972031@qq.com', '上海徐汇', '管理学', '北京《瑞丽》杂志社', '0', '2016/05/27 23:13:22', 'admin', '2016/05/27 23:13:22', 'admin');
INSERT INTO `usst_user` VALUES ('dc4282a4623c4493ba3f2793d738ac44', '000003', '123456', '408ad45f563c2c7a89ab7ddcb5c14a7a', '1', '321', '18888888888', '993484167@qq.com', '', '', '', '1', '2016/05/29 20:22:45', 'system', '2016/05/29 20:22:45', 'system');
INSERT INTO `usst_user` VALUES ('947d02ab876b4138b45602c56948d871', '000003', 'adcwwewe', '96e79218965eb72c92a549dd5a330112', '1', 'checkUserName', '13188989999', '13122787976@qq.com', '', '', '', '1', '2016/05/31 18:00:50', 'system', '2016/05/31 18:00:50', 'system');

-- ----------------------------
-- Table structure for usst_user_email
-- ----------------------------
DROP TABLE IF EXISTS `usst_user_email`;
CREATE TABLE `usst_user_email` (
  `id` varchar(32) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `sender` varchar(32) NOT NULL COMMENT '发送人',
  `receiver` varchar(32) DEFAULT NULL COMMENT '收件人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '正文',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(32) DEFAULT NULL,
  `createBy` varchar(32) NOT NULL,
  `lstUpdateOn` varchar(32) NOT NULL,
  `lstUpdateBy` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_user_email
-- ----------------------------
INSERT INTO `usst_user_email` VALUES ('a0fad3ace3b5496ba4a5dfe31c21a9cd', '8529f32239a74ac9afeffe4b933fc0af', '13899997777@qq.com', '13899998888@163.com', '稿件情况', '一般稿件知道最终结果需要多少天。', '0', '2016/05/26 23:22:09', '小明', '2016/05/26 23:22:09', '小明');
INSERT INTO `usst_user_email` VALUES ('c43bf0f64f004d3eaef95466272abe62', '5cf913b29c474ff5bf1bbd67bdc2d027', '13899997777@qq.com', '13899998888@163.com', '稿件情况', '一般稿件知道最终结果需要多少天。', '1', '2016/05/26 23:22:09', 'Linda', '2016/05/26 23:22:09', 'Linda');
INSERT INTO `usst_user_email` VALUES ('1035d4bfe0e84f9b98bdf2df0b642603', '5cf913b29c474ff5bf1bbd67bdc2d027', '13899998888@163.com', '13899997777@qq.com', '回复稿件情况', '大概需要3天', '1', '2016/05/26 23:46:10', '琳达', '2016/05/26 23:46:10', '琳达');
INSERT INTO `usst_user_email` VALUES ('4edc1fccff444d87b11b9020227efbf2', '8529f32239a74ac9afeffe4b933fc0af', '13899998888@163.com', '13899997777@qq.com', '回复稿件情况', '大概需要3天', '1', '2016/05/26 23:46:10', 'xiaoming', '2016/05/26 23:46:10', 'xiaoming');
INSERT INTO `usst_user_email` VALUES ('dd4b713619fc433daf9ebcd2559502c5', '5628fcbc6bed4ad7831ede47ace3c794', 'admin@qq.com', '993484167@qq.com', 'b\'vhbvj', 'nkn', '1', '2016/05/29 20:47:54', 'admin', '2016/05/29 20:47:54', 'admin');
INSERT INTO `usst_user_email` VALUES ('43b559d842464ebfb7a829bfe3073b5a', 'dc4282a4623c4493ba3f2793d738ac44', 'admin@qq.com', '993484167@qq.com', 'b\'vhbvj', 'nkn', '1', '2016/05/29 20:47:54', '123456', '2016/05/29 20:47:54', '123456');
INSERT INTO `usst_user_email` VALUES ('03766e06a6614d83843f032cd0925060', 'dc4282a4623c4493ba3f2793d738ac44', '993484167@qq.com', 'admin@qq.com', 'www', 'www', '1', '2016/05/29 20:48:16', '321', '2016/05/29 20:48:16', '321');
INSERT INTO `usst_user_email` VALUES ('e7b258fdc2484e66906e7ad32d9d9465', '5628fcbc6bed4ad7831ede47ace3c794', '993484167@qq.com', 'admin@qq.com', 'www', 'www', '1', '2016/05/29 20:48:16', 'admin', '2016/05/29 20:48:16', 'admin');

-- ----------------------------
-- Table structure for usst_user_role
-- ----------------------------
DROP TABLE IF EXISTS `usst_user_role`;
CREATE TABLE `usst_user_role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(16) DEFAULT NULL COMMENT '角色名称',
  `enabled` varchar(1) DEFAULT NULL,
  `createOn` varchar(17) DEFAULT NULL,
  `createBy` varchar(16) DEFAULT NULL,
  `lstUpdateOn` varchar(17) DEFAULT NULL,
  `lstUpdateBy` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usst_user_role
-- ----------------------------
INSERT INTO `usst_user_role` VALUES ('000001', '管理员', '1', '20160330002000', 'system', '20160330002000', 'system');
INSERT INTO `usst_user_role` VALUES ('000002', '审核员', '1', '20160330002000', 'system', '20160330002000', 'system');
INSERT INTO `usst_user_role` VALUES ('000003', '作者', '1', '20160330002000', 'system', '20160330002000', null);
