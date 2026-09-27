# INT4211 - LẬP TRÌNH TRÊN CÁC THIẾT BỊ DI ĐỘNG
## BÁO CÁO THỰC HÀNH LAB F2: BỐ CỤC GIAO DIỆN TRONG FLUTTER – DỰNG LẠI MÀN HÌNH CỦA LAB A3

---

### THÔNG TIN SINH VIÊN
* **Họ và tên:** Đỗ Lê Tuấn Đạt
* **Mã số sinh viên (MSSV):** 231A290089
* **Lớp học phần:** Lập trình thiết bị di động (INT4211)
* **Môi trường thực thi:** VS Code / Android Studio trên macOS (Apple Silicon)[cite: 9, 10]
* **Thiết bị thử nghiệm:** Máy ảo Pixel 8 (Android 17, API 37.1 – aarch64) & Google Chrome[cite: 9]
* **Repository GitHub:** `https://github.com/tuandatdl/F2_231A290089` [cite: 9, 10]

---

### CÁC MỤC ĐÃ HOÀN THÀNH

#### 1. Dựng lại toàn bộ màn hình "Cổng thực hành LTDD" bằng Flutter Widget (Material 3)
* **Khung ba lớp chống tràn:** Sử dụng kiến trúc `Scaffold` ➔ `SafeArea` ➔ `SingleChildScrollView` giúp màn hình co giãn linh hoạt và tự động cuộn khi mở bàn phím ảo, loại bỏ hoàn toàn nguy cơ lỗi RenderFlex[cite: 9].
* **Header & Avatar xếp chồng lớp (Stack + Positioned):**
  * Nền chuyển màu Gradient (`LinearGradient`) góc chéo từ `primary` sang `tertiary`, cao 150dp, bo cong 2 góc đáy 24dp bằng `BoxDecoration`[cite: 9].
  * Dùng `Stack` (tổng chiều cao 196dp) kết hợp `Positioned(bottom: 0)` để đặt `CircleAvatar` tròn 92dp (chữ **LT**) nằm đè chính xác một nửa lên mép dưới của ảnh bìa[cite: 9].
* **Form Đăng nhập chuẩn Material Design:**
  * Áp dụng `ThemeData` với `ColorScheme.fromSeed(seedColor: Color(0xFF0468D7))` và `InputDecorationTheme` viền `OutlineInputBorder` đồng bộ[cite: 9].
  * Ô nhập MSSV (`keyboardType: TextInputType.number`) kèm icon định danh[cite: 9].
  * Ô nhập Mật khẩu ẩn ký tự (`obscureText`), tích hợp `IconButton` bật/tắt hiển thị mật khẩu bằng `setState()`[cite: 9].
  * Hàng điều khiển gồm `Checkbox` "Ghi nhớ đăng nhập", khoảng trống co giãn `Spacer()` đẩy nút chữ "Quên mật khẩu?" sang sát mép phải[cite: 9].
  * Nút chính `FilledButton` "ĐĂNG NHẬP" rộng hết bề ngang, bấm vào hiển thị `SnackBar` thông báo trạng thái kèm ghi nhớ đăng nhập[cite: 9].
  * Dải phân cách "hoặc": 2 đường kẻ `Divider()` bọc trong `Expanded` chia đều hai bên[cite: 9].
  * Nút viền `OutlinedButton.icon` "Đăng nhập bằng tài khoản trường" và hàng Text chuyển hướng "Chưa có tài khoản? Đăng ký"[cite: 9].
* **Thẻ hồ sơ sinh viên cá nhân:**
  * Hiển thị đầy đủ thông tin: **Đỗ Lê Tuấn Đạt**, MSSV **231A290089**, lớp **CNTT LTDD**, email **231a290089@vhu.edu.vn**[cite: 9].
  * Hai ô thống kê điểm số (*2 Lab đã nộp* | *8.5 Điểm TB lab*) được chia đôi chiều ngang theo tỷ lệ 1:1 bằng `Row` và `Expanded`[cite: 9].

#### 2. Khảo nghiệm & Khắc phục lỗi RenderFlex overflowed (Phần 5)
* **Thực nghiệm gây lỗi:** Tạm thời bỏ `SingleChildScrollView`, thay bằng `Container` và kích hoạt bàn phím ảo trên máy ảo Pixel 8; hệ thống lập tức xuất hiện dải sọc vàng-đen ở đáy kèm thông báo `A RenderFlex overflowed by ... pixels on the bottom`[cite: 9].
* **Nguyên nhân cốt lõi:** `Column` có chiều cao bằng tổng chiều cao các con; khi bàn phím ảo trồi lên làm giảm chiều cao khả dụng của màn hình, không gian cha cấp xuống không đủ chứa các phần tử con[cite: 9].
* **Khắc phục:** Bọc toàn bộ nội dung trong `SingleChildScrollView` để cung cấp không gian cuộn không giới hạn theo trục dọc[cite: 9].

#### 3. Bố cục thích ứng (Responsive) bằng LayoutBuilder (Phần 6)
* Sử dụng `LayoutBuilder` để đo kích thước thực tế của vùng chứa (`constraints.maxWidth`):
  * **Màn hình hẹp (`maxWidth < 700` - Điện thoại dọc):** Xếp dạng 1 cột dọc (`Column`), Form nằm trên và Thẻ hồ sơ nằm dưới[cite: 9].
  * **Màn hình rộng (`maxWidth >= 700` - Màn hình ngang / Tablet / Web Chrome):** Tự động chuyển sang bố cục 2 cột nằm ngang (`Row`): Form đăng nhập chiếm 3 phần (`flex: 3`) và Thẻ hồ sơ chiếm 2 phần (`flex: 2`)[cite: 9].
* Không cần nhân bản nhiều file giao diện như Android XML (`res/layout-land`), toàn bộ logic gom gọn trong 1 cây widget duy nhất[cite: 9].

#### 4. Bài nâng cao NC1: Chế độ tối (Dark Mode)
* Cấu hình đồng thời `theme` (Light Mode) và `darkTheme` (Dark Mode sử dụng `brightness: Brightness.dark`) trong `MaterialApp`[cite: 9].
* Đặt một `IconButton` trên góc phải của `HeaderBanner` để chuyển đổi trạng thái `ThemeMode` tức thời qua `setState()`, cho phép người dùng đổi giao diện Sáng/Tối trực tiếp ngay trên app[cite: 9].

#### 5. Bài nâng cao NC2: Kiến trúc Module hóa tách widget vào `lib/widgets/`
* Tách toàn bộ các thành phần phức tạp khỏi `lib/main.dart` thành các file độc lập[cite: 9]:
  * `lib/widgets/header_banner.dart`: Khối ảnh bìa gradient, avatar và nút toggle Dark Mode[cite: 9].
  * `lib/widgets/profile_card.dart`: Thẻ hồ sơ sinh viên dùng chung các `ListTile`[cite: 9].
  * `lib/widgets/stat_box.dart`: Khối hiển thị ô điểm số thống kê có thể tái sử dụng[cite: 9].
* Bỏ dấu gạch dưới `_` ở đầu tên các class để công khai phạm vi sử dụng và nạp vào `main.dart` bằng lệnh `import 'widgets/...';` chuẩn chỉ[cite: 9].

---

### CẤU TRÚC THƯ MỤC DỰ ÁN
```text
f2_layout/
├── pubspec.yaml                   # Khai báo cấu hình dự án Flutter
├── README.md                      # Báo cáo tổng hợp dự án
└── lib/
    ├── main.dart                  # Điểm khởi chạy MyApp, LoginPage, Form & LayoutBuilder
    └── widgets/                   # Thư mục chứa các module Widget độc lập (NC2)
        ├── header_banner.dart     # Khối Banner Gradient, Avatar tròn & nút Dark Mode (NC1)
        ├── profile_card.dart      # Thẻ hồ sơ cá nhân sinh viên Đỗ Lê Tuấn Đạt
        └── stat_box.dart          # Khối hiển thị ô điểm số thống kê bo góc
