-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2021 at 04:27 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `percy-book-store`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `nameofbook` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `publishing` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `price` int(10) NOT NULL,
  `synopsis` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `languages` varchar(10) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `image` varchar(50) NOT NULL,
  `dateUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countView` int(11) NOT NULL DEFAULT '0',
  `id` int(5) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `countBuy` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`nameofbook`, `author`, `publishing`, `price`, `synopsis`, `languages`, `image`, `dateUpdate`, `countView`, `id`, `type`, `countBuy`) VALUES
('The Lord Of The Rings', 'J.R.R TOLKIEN', 'NXB Văn Học', 132000, 'Kỷ Đệ Nhất, các Valar kết liễu Morgoth.\r\n\r\nKỷ Đệ Nhị, Tiên và Người đánh bại Sauron.\r\n\r\nVà nay, giữa Kỷ Đệ Tam tưởng đã hòa bình, báu vật của Sauron lại ngóc đầu trong lòng núi.\r\n\r\nVà thêm một anh chàng Hobbit bỗng thấy mình từ biệt tổ ấm yên bình, dấn vào cuộc phiêu lưu mỗi bước lại thêm xa, thêm gian nan, thêm hệ trọng. Bên cậu sát cánh Đoàn Hộ Nhẫn, Con Người cùng Phù Thủy, Tiên với Người Lùn, vượt đèo cả đầm sâu, qua rừng vàng mỏ tối, vào sinh ra tử hòng lần nữa cứu Trung Địa khỏi rơi vào tay\r\n\r\nCHÚA TỂ NHỮNG CHIẾC NHẪN.', 'Tiếng Việt', 'http://localhost:4000/img/1.jpg', '2021-07-22 16:17:57', 11, 1, 'foreign_literature', 5),
('Harry Potter', 'J.K ROWLING', 'NXB Trẻ', 108000, 'Khi một lá thư được gởi đến cho cậu bé Harry Potter bình thường và bất hạnh, cậu khám phá ra một bí mật đã được che giấu suốt cả một thập kỉ. Cha mẹ cậu chính là phù thủy và cả hai đã bị lời nguyền của Chúa tể Hắc ám giết hại khi Harry mới chỉ là một đứa trẻ, và bằng cách nào đó, cậu đã giữ được mạng sống của mình. Thoát khỏi những người giám hộ Muggle không thể chịu đựng nổi để nhập học vào trường Hogwarts, một trường đào tạo phù thủy với những bóng ma và phép thuật, Harry tình cờ dấn thân vào một cuộc phiêu lưu đầy gai góc khi cậu phát hiện ra một con chó ba đầu đang canh giữ một căn phòng trên tầng ba. Rồi Harry nghe nói đến một viên đá bị mất tích sở hữu những sức mạnh lạ kì, rất quí giá, vô cùng nguy hiểm, mà cũng có thể là mang cả hai đặc điểm trên.', 'Tiếng Việt', 'http://localhost:4000/img/2.jpg', '2021-07-26 16:18:01', 9, 2, 'foreign_literature', 13),
('Doraemon', 'Fujiko F Fujio', 'NXB Kim Đồng', 16000, 'Những chuyến phiêu lưu không bị hạn chế bởi không gian và thời gian. Đó là chuyến du hành vượt qua thời gian trở về thời tiền sử của vũ trụ (Nobita và lịch sử khai phá vũ trụ), của trái đất (Chú khủng long của Nobita), của nước Nhật (Nobita và nước Nhật thời nguyên thủy), đến tương lai (Nobita và cuộc phiêu lưu ở thành phố dây cót, Nobita và vương quốc robot)... 24 chuyến phiêu lưu của nhóm bạn có đích đến là 24 địa điểm kỳ thú, chỉ có trí tưởng tượng và ước mơ có thể vươn tới (Nobita và hành tinh muông thú, Nobita và chuyến du hành xứ quỷ...).', 'Tiếng Việt', 'http://localhost:4000/img/3.jpg', '2021-07-26 16:18:06', 8, 3, 'comic', 10),
('Đắc Nhân Tâm', 'Dale Carnegie', 'NXB Tổng Hợp TPHCM', 76000, 'Đắc nhân tâm của Dale Carnegie là quyển sách duy nhất về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Được xuất bản năm 1936, với số lượng bán ra hơn 15 triệu bản, tính đến nay, sách đã được dịch ra ở hầu hết các ngôn ngữ, trong đó có cả Việt Nam, và đã nhận được sự đón tiếp nhiệt tình của đọc giả ở hầu hết các quốc gia.\r\n\r\nLà quyển sách đầu tiên có ảnh hưởng làm thay đổi cuộc đời của hàng triệu người trên thế giới, Đắc Nhân Tâm là cuốn sách đem lại những giá trị tuyệt vời cho người đọc, bao gồm những lời khuyên cực kì bổ ích về cách ứng xử trong cuộc sống hàng ngày. Sức lan toả của quyển sách vô cùng rộng lớn – với nhiều tầng lớp, đối tượng.\r\n\r\nĐắc Nhân Tâm không chỉ là là nghệ thuật thu phục lòng người, Đắc Nhân Tâm còn đem lại cho độc giả góc nhìn, suy nghĩ sâu sắc về việc giao tiếp ứng xử.\r\n\r\nTriết lý của Đắc Nhân Tâm là  hiểu mình, thành thật với chính mình, từ đó hiểu biết và quan tâm đến những người xung quanh để nhìn ra và khơi gợi những tiềm năng ẩn khuất nơi họ, giúp họ phát triển lên một tầm cao mới. Đây chính là nghệ thuật cao nhất về con người và chính là ý nghĩa sâu sắc nhất đúc kết từ những nguyên tắc vàng của Dale Carnegie.', 'Tiếng Việt', 'http://localhost:4000/img/4.jpg', '2021-08-02 16:18:10', 7, 4, 'foreign_literature', 4),
('Trên Đường Băng ', 'Tony Buổi Sáng', 'NXB Trẻ', 66000, 'TRÊN ĐƯỜNG BĂNG là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.\r\n\r\nCuốn Trên Đường Băng được chia làm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.\r\n\r\nXuất phát từ cái tâm trong sáng của người đi trước dày dặn kinh nghiệm, kiến thức, Tony Buổi Sáng mang đến đọc giả những bài viết hài ước, tinh tế, sinh động và đầy thiết thực. Cuốn Trên Đường Băng với những bài viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh… truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây và sẵn sàng cho hành trang cuộc sống.\r\n\r\nTrên Đường Băng của Tony Buổi Sáng tuy hướng đến những đọc giả là những người trẻ nhưng những người lớn hơn vẫn để hiểu hơn, và có cách nhìn nhận cũng như giáo dục con em mình tốt nhất thay vì bảo vệ con quá kĩ trở nên yếu ớt và thiếu tự lập. Và để yêu thương “khoa học” nhất. Đây cũng là cuốn sách mà những người đi làm nên sở hữu để nhìn lại chặng đường mình đã đi qua, suy ngẫm và thay đổi vì chưa bao giờ là quá muộn.\r\n\r\nMột cuốn sách với nhiều điều để bạn học hỏi, suy ngẫm và chuẩn bị tốt nhất cho hành trang trên con đường tuổi trẻ của chính mình.', 'Tiếng Việt', 'http://localhost:4000/img/5.jpg', '2021-07-26 16:18:15', 6, 5, 'domestic_literature', 6),
('Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', 'NXB Hội Nhà Văn', 66000, '“Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.\r\n\r\nBạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.\r\n\r\nBạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.\r\n\r\nSuy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.\r\n\r\nNên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách bạn cho là mình nên sống.\r\n\r\nVì sau tất cả, chẳng ai quan tâm.”\r\n\r\n“Tôi đã đọc quyển sách này một cách thích thú. Có nhiều kiến thức và kinh nghiệm hữu ích, những điều mới mẻ ngay cả với người gần trung niên như tôi.\r\n\r\nTuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.\r\n\r\nNhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.\r\n\r\nHãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.\r\n\r\nNếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần.”\r\n\r\n- Đặng Nguyễn Đông Vy, tác giả, nhà báo', 'Tiếng Việt', 'http://localhost:4000/img/6.jpg', '2021-07-26 16:18:18', 0, 6, 'domestic_literature', 8),
('Cứ Bình Tĩnh', 'Tuệ Nghi', 'NXB Hà Nội', 70000, 'Tuần hoàn cuộc sống, có yêu thì sẽ có ghét. Sẽ là bất khả thi nếu khuyên con người đừng ghét bỏ ai. Tôi cũng từng ghét người khác, vì tôi nghĩ rằng họ là tác nhân khiến tôi mất đi điều tôi yêu quý. Nhưng suy cho cùng, nếu thứ đó thật sự là của tôi, thì chẳng ai lấy đi được, chẳng ai tác động được. Chỉ có tôi, nếu cứ tiếp tục thù ghét họ thì chính tôi mới tự lấy đi bình yên của bản thân mình. Và tôi quyết định thôi nghĩ về họ. Người đánh vào đời ta một cái, ta xô lại người một cái, oan oan tương báo đến bao giờ mới dứt? Lẽ thường con người ta cứ thấy mình trong vòng xoáy lẩn quẩn là vì thế. Nếu không thể thương nhau, thì cũng đừng ghét, mà đã ghét thì hãy tránh xa chứ đừng nên tìm cách trả đũa nhau làm gì.\r\n\r\nThời vụng dại, hứa yêu nhau mãi mãi, yêu đến sông cạn núi mòn. Khi trưởng thành rồi mới hiểu trên đời này chẳng có điều gì là mãi mãi, kể cả tình yêu. Chỉ có kỷ niệm đẹp mới tồn tại vĩnh viễn trong ký ức của mỗi người, nên sống tốt với nhau được ngày nào quý ngày đó.\r\n\r\nHãy cố gắng đặt niềm tin vào đúng người, nếu có vô tình đặt sai thì hãy hiểu rằng niềm tin vào chính bản thân mình vẫn là nguyên vẹn, chỉ có lòng tin dành cho người không xứng đáng mới bị sứt mẻ đi.  Và ta phải có đủ bản lĩnh để vượt qua những cám dỗ trong cuộc đời, bản lĩnh để cùng nhau đi qua ngày sóng gió, bản lĩnh để vượt qua đớn đau khổ lụy trong tình yêu mà không đánh mất chính mình.\r\n\r\nMọi chuyện xảy ra trên đời này đều có nguyên nhân của nó, nếu cuộc đời ban cho ta quả đắng thì việc của ta chính là bình tĩnh đón nhận, bình tĩnh đối mặt và bình tĩnh bước qua.', 'Tiếng Việt', 'http://localhost:4000/img/7.jpg', '2021-07-26 16:18:21', 4, 7, 'domestic_literature', 9),
('Hoàng Tử Bé', 'Antoine De Saint-Exupéry', 'NXB Hội Nhà Văn', 64000, 'Hoàng tử bé được viết ở New York trong những ngày tác giả sống lưu vong và được xuất bản lần đầu tiên tại New York vào năm 1943, rồi đến năm 1946 mới được xuất bản tại Pháp. Không nghi ngờ gì, đây là tác phẩm nổi tiếng nhất, được đọc nhiều nhất và cũng được yêu mến nhất của Saint-Exupéry. Cuốn sách được bình chọn là tác phẩm hay nhất thế kỉ 20 ở Pháp, đồng thời cũng là cuốn sách Pháp được dịch và được đọc nhiều nhất trên thế giới. Với 250 ngôn ngữ dịch khác nhau kể cả phương ngữ cùng hơn 200 triệu bản in trên toàn thế giới, Hoàng tử bé được coi là một trong những tác phẩm bán chạy nhất của nhân loại. ', 'Tiếng Việt', 'http://localhost:4000/img/8.jpg', '2021-08-02 16:18:25', 8, 8, 'foreign_literature', 11),
('Nghìn Lẻ Một Đêm', 'Antoine Galland', 'NXB Văn Học', 135000, 'Nghìn lẻ một đêm, tác phẩm vĩ đại bậc nhất của nền văn học Ả Rập từ cổ chí kim, là một trong những công trình sáng tạo đồ sộ và tuyệt diệu của nền văn học thế giới. Macxim Gorki từng ca ngợi: “Trong các di sản tuyệt diệu của sáng tác truyền khẩu dân gian, các câu chuyện cổ tích của nàng Sêhêrazát là di sản đồ sộ nhất.\r\n\r\nNhững câu chuyện này thể hiện ở mức hoàn hảo diệu kỳ, xu hướng của người dân lao động muốn buông mình theo “phép nhiệm mầu của những ảo giác êm đẹp”, trong sự kết hợp phóng khoáng của những ngôn từ mang sức mạnh tưởng tượng huyền ảo của các dân tộc phương Đông - Ả Rập, Ba Tư, Ấn Độ. Công trình thêu hoa dệt gấm bằng từ ngữ này đã xuất hiện từ rất xa xưa, nhưng đến nay những sợi tơ muôn màu của nó vẫn lan khắp bốn phương, phủ lên trái đất một tấm thảm ngôn từ đẹp đẽ lạ lùng.”\r\n\r\nCác câu chuyện cứ nối tiếp vào nhau, truyện sau lồng vào truyện trước. Truyện này chưa hết truyện khác đã bắt đầu dường như vô tận. Trước mắt chúng ta hiện lên không biết bao nhiêu là nhân vật: từ hoàng đế, tể tưởng, hoàng tử, vương tôn, quan cai ngục, viên hoạn nô, tên cướp biển…\r\n\r\nTất cả được liên kết thành một chuỗi ngọc tuyệt tác muôn vẻ muôn màu qua lời kể của người con gái tài sắc vẹn toàn, thông minh rất mực, không quản hiểm nguy dám hy sinh tấm thân ngà ngọc của mình để cứu các bạn gái khỏi cảnh ô nhục và cái chết bi thương.\r\n\r\nMời bạn đón đọc!', 'Tiếng Việt', 'http://localhost:4000/img/9.jpg', '2021-07-26 16:18:28', 9, 9, 'family_and_children', 2),
('Dế Mèn Phiêu Lưu Ký', 'Tô Hoài', 'NXB Kim Đồng', 43000, '“Một con dế đã từ tay ông thả ra chu du thế giới tìm những điều tốt đẹp cho loài người. Và con dế ấy đã mang tên tuổi ông đi cùng trên những chặng đường phiêu lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thiên nhiên và văn hóa của các quốc gia khác. Dế Mèn Tô Hoài đã lại sinh ra Tô Hoài Dế Mèn, một nhà văn trẻ mãi không già trong văn chương...” - Nhà phê bình Phạm Xuân Nguyên\r\n\r\n“Ông rất hiểu tư duy trẻ thơ, kể với chúng theo cách nghĩ của chúng, lí giải sự vật theo lô gích của trẻ. Hơn thế, với biệt tài miêu tả loài vật, Tô Hoài dựng lên một thế giới gần gũi với trẻ thơ. Khi cần, ông biết đem vào chất du ký khiến cho độc giả nhỏ tuổi vừa hồi hộp theo dõi, vừa thích thú khám phá.” - TS Nguyễn Đăng Điệp', 'Tiếng Việt', 'http://localhost:4000/img/10.jpg', '2021-07-26 16:18:33', 10, 10, 'domestic_literature', 9),
('Grimgar - Ảo Ảnh Và Tro Tàn - Tập 2', 'Jyumonji Ao, Shirai Eiri', 'NXB Kim Đồng', 68000, '"Thì thầm, niệm chú, cầu nguyện và thức tỉnh...\r\n\r\nĐây là câu chuyện phiêu lưu được sinh ra từ trong đám tro tàn."\r\n\r\nSau khi bị đưa tới “Grimgar”, một thế giới hoàn toàn xa lạ, nhóm Haruhiro cố gắng tích luỹ kinh nghiệm và cuối cùng đã vượt qua được giai đoạn “lính mới”. Để nâng cao năng lực chiến đấu, họ quyết định thử sức với địa điểm mới mang tên “Mỏ Cyrene”. Nhưng đó cũng chính là nơi thành viên vừa gia nhập tổ đội - Merry - mất đi những đồng đội cũ trong quá khứ. Chuyến thám hiểm của nhóm Haruhiro tưởng chừng diễn ra thuận lợi, nhưng cả bọn bất ngờ bị dồn vào tình huống không ngờ tới, buộc phải xé lẻ. Không những vậy, họ còn phải đương đầu với cuộc tấn công của con kobold khổng lồ, mang cái tên quái dị là Dead Spot.\r\n\r\nChúng ta hãy đến với chương thứ hai của câu chuyện phiêu lưu sinh ra từ trong đám tro tàn, cùng muôn vàn những thử thách mới!', 'Tiếng Việt', 'http://localhost:4000/img/11.jpg', '2021-08-02 16:18:36', 0, 11, 'foreign_literature', 0),
('Sherlock Holmes Toàn Tập - Tập 1', 'Sir Arthur Conan Doyle', 'NXB Thanh Niên', 96000, '“Tên tôi là Sherlock Holmes. Công việc của tôi là để biết những gì mà người khác không biết.” - Sherlock Holmes -\r\n\r\nSherlock Holmes lần đầu xuất hiện trong "Chiếc nhẫn tình cờ" với một phương pháp điều tra rất khoa học nhưng cuộc sống riêng lại bừa bộn và cùng cuộc gặp gỡ giữa Holmes với bác sĩ Watson mở đầu cho những vụ án đặc sắc, mà sau này, hai người bạn tri kỷ đã đồng hành cùng phá án. Vị thám tử London nhanh chóng thu hút độc giả bằng trí thông minh và khả năng suy luận tài tình của mình. Ngay từ thiên truyện đầu, bằng việc phân tích dòng chữ Rache" được viết bằng máu ở trên tường, Holmes đã đoán ngay ra hung thủ và tung tích của hắn trước sự ngạc nhiên của tất cả mọi người, Tài năng của Holmes được chứng minh qua vụ án này đến vụ án khác, từ những cuộc mất tích bí ẩn đến những án mang mà cảnh sát cũng phải bó tay.\r\n\r\nBộ truyện Sherlock Holmes toàn tập gồm 6 tập sẽ đưa độc giả đi khám phá đầy đủ về lối tư duy lạnh lùng nhưng cũng đầy sắc sảo khi phán đoán cảm xúc của người đối diện và lòng gan dạ của vị thám tử nổi tiếng. Bốn tiểu thuyết và năm mươi sáu truyện ngắn về Sherlock Holmes Của Conan Doyle được sắp xếp ngẫu hứng tạo sự đa dạng cho từng tập truyện của bộ Sherlock Holmes toàn tập này. Sau hơn 100 năm từ khi ra đời, nhân vật Sherlock Holmes vẫn mãi là hình tượng bất tử trong thế loại văn học trinh thám.', 'Tiếng Việt', 'http://localhost:4000/img/12.jpg', '2021-08-03 08:30:05', 0, 12, 'foreign_literature', 0),
('Naruto', 'Masashi Kishimoto', 'NXB Kim Đồng', 105300, 'Cuộc chiến giữa đôi bạn thân Sasuke và Naruto ngày càng khốc liệt hơn. Liệu Sasuke có mạo hiểm mọi thứ, thậm chí cả tính mạng của Naruto, để có được sức mạnh của Mangekyo? Naruto và Sasuke được chứng minh là xứng đôi. Trong nỗ lực giành chiến thắng, mỗi người đều sử dụng sức mạnh riêng biệt của mình: Naruto và sức mạnh của cáo quỷ, Sasuke và nguồn dự trữ phong ấn bị nguyền rủa của anh ta. Naruto và Sasuke lần lượt truyền nguồn sức mạnh của họ vào Rasengan và Chidori, rồi tấn công lẫn nhau.Tuy nhiên, điều này hơi đáng thất vọng. Nó hay nhưng không tốt hơn khi so sánh với những tập cuối cùng. Giai đoạn thứ hai của kỳ thi chunin đã bắt đầu và các đội còn lại được phát một cuộn giấy để phòng thủ trước kẻ thù. Họ phải làm việc theo nhóm để bảo vệ cuộn của mình và đưa cuộn của đối phương đi qua. Khi kỳ thi diễn ra, chúng ta thấy các thành viên của Đội 7 chống lại một kẻ thù nguy hiểm. Chúng ta thấy lối vào của một trong những nhân vật phản diện nguy hiểm nhất trong truyện, Orochimaru. Chúng ta cũng thấy tính cách hoàn toàn trái ngược với Sasuke và điều tương tự cũng có thể nói về Sakura vì phần sau của tập là về Sakura.', 'Tiếng Việt', 'http://localhost:4000/img/13.jpg', '2021-08-14 17:31:52', 0, 13, 'Comic', 0);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `nameOfDiscount` varchar(11) NOT NULL,
  `dateStart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateEnd` timestamp NULL DEFAULT NULL,
  `value` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `nameOfDiscount`, `dateStart`, `dateEnd`, `value`) VALUES
(1, 'PFIEV', '2021-08-03 06:50:04', NULL, 20),
(3, 'summer2021', '2021-08-15 11:07:26', NULL, 30),
(4, 'lalala', '2021-08-15 11:21:54', NULL, 20),
(5, 'ch3cooh', '2021-08-15 11:22:48', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nameofbook` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `dateRequest` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `email`, `nameofbook`, `author`, `country`, `dateRequest`) VALUES
(1, 'a@gmail.com', 'conan', 'aoyama gossho', 'Japan', '2021-08-15 21:09:36'),
(3, 'a@gmail.com', 'undefined', 'undefined', 'undefined', '2021-08-15 21:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `password` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `account_type` varchar(10) NOT NULL DEFAULT 'client',
  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `id` int(11) NOT NULL,
  `idInCart` varchar(255) NOT NULL DEFAULT '0',
  `countProductInCart` int(11) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `synopsis` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `avatar` text NOT NULL,
  `university` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `profession` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `age` int(11) NOT NULL,
  `linkFacebook` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `email`, `account_type`, `firstName`, `lastName`, `id`, `idInCart`, `countProductInCart`, `address`, `city`, `country`, `synopsis`, `avatar`, `university`, `profession`, `age`, `linkFacebook`) VALUES
(NULL, 'admin', 'admin@gmail.com', 'staff', '', '', 0, '0', 0, '', '', '', '', '', '', '', 0, ''),
('Hokage Đệ Thất', 'a', 'a@gmail.com', 'client', 'Nar Nổ', 'Uzumaki', 1, '0 11 5 12 5', 0, 'tổ 29, phường Thạch Than, quận Hải Châu', 'Danang', 'Vietnam', 'Wibu never die!', '/avatar/5.jpeg', 'University of Science and Technology in Danang', 'Thợ Hồ', 22, 'https://www.facebook.com/duydat.thai/'),
('null', 'c', 'c@gmail.com', 'client', 'Hiền', 'Phan', 2, '0', 0, '', '', '', '', '', '', '', 0, ''),
('', 'client', 'client@gmail.com', 'client', 'Khachaaaaaaaaaaa', '', 3, '0', 0, '', '', '', '', '', '', '', 0, ''),
('22', 'phanhien203', 'phanhien203@gmail.com', 'client', '', '', 4, '0', 0, '0', '', '', '', '', '', '', 0, ''),
('thaidat012345', 'quang123', 'thaidat01222@gmail.com', 'client', 'Duy', 'Thai', 5, '0', 0, 'tổ 13 phường Hòa Quý, quận Ngũ Hành Sơn', 'Danang', 'Vietnam', 'Hiiiiiiiii', '/avatar/5.jpeg', 'BK DN', 'SV', 0, 'facebook.com/duydat.thai'),
('1', '1', '1', 'client', 'undefined', 'undefined', 11, '0', 0, '1', '', '', '', '', '', '', 0, ''),
('44', '33', '22', 'client', '55', '66', 15, '0', 0, '77', '', '', '', '', '', '', 0, ''),
('null', '123123123', 'percyusjasson@gmail.com', 'client', 'Percy', 'Jackson', 16, '0', 0, '', '', '', '', '', '', '', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
