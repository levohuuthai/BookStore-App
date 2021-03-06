package UI;

import java.awt.BorderLayout;

import java.awt.Color;
import java.awt.Container;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowStateListener;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.WindowConstants;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import javax.swing.filechooser.FileNameExtensionFilter;

import connectDB.ConnectDB;
import dao.DAO_Sach;
import dao.DAO_LoaiSach;
import entity.LoaiSach;
import entity.Sach;
import others.LuuThongTinSach;
import others.ResourceManager;
/**
 * 
 * L?? V?? H???u Th??i
 *
 */
public class FormThemSach extends JFrame implements ActionListener, MouseListener, KeyListener{
	private DAO_Sach sachDao;
	private ArrayList<Sach> listSach;
	private DAO_LoaiSach daoLoaiSach;
	private ArrayList<LoaiSach> listLoaiSach;
	private static Sach s;	
	JPanel pnHinhAnh;
	JPanel pnKhungHinhAnh;
	public static JTextArea  txtTenSach;
	private JLabel lblHinhAnh, lblChonAnh;
	private JButton btnChonAnh, btnLuu, btnLamMoi;
	private JTextField txtMaSach,txtDonGia, txtSoLuongTon, txtTacGia,txtSoTrang;
	//public static String hinhAnh="                       Ch??a c?? h??nh ???nh";
	public static String hinhAnh="img\\chuacohinhanh.png";
	private JComboBox<String>  cbxTheLoai, cbxNhaCungCap, cbxNhaXuatBan, cbxNamXuatBan;
	private JDialog jDialog;
	LuuThongTinSach thongTinSach;
	public static TextField txtRefunds;
	JTextField txtLoiNamXuatBan, txtLoiTrang, txtLoi, txtLoiDonGia;

	public FormThemSach() {

		try {
			ConnectDB.getInstance().connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		sachDao = new DAO_Sach();
		daoLoaiSach = new DAO_LoaiSach();
		listSach = sachDao.getAllTbSach();
		s = new Sach();

		jDialog = new JDialog();
		jDialog.setTitle("Th??m S??ch");
		//jDialog.setDefaultCloseOperation(EXIT_ON_CLOSE);	
		jDialog.setSize(950,680);
		jDialog.setLocationRelativeTo(null);
		jDialog.setModal(true);
		
		ImageIcon imgDefault = new ImageIcon("Icon/iconCuaHangSach.png");
		Image imgDefault1 = imgDefault.getImage();
		Image newImgDefault1 = imgDefault1.getScaledInstance(35, 35, Image.SCALE_SMOOTH);
		imgDefault = new ImageIcon(newImgDefault1);
		jDialog.setIconImage(imgDefault.getImage());

		//NORTH
		JPanel pnNorth = new JPanel();
		pnNorth.setLayout(new BoxLayout(pnNorth, BoxLayout.Y_AXIS));
		pnNorth.setBackground(Color.RED);



		JPanel pnTieuDe = new JPanel();
		//pnTieuDe.setBackground(Color.BLUE);
		JLabel lblTieuDe = new JLabel("Th??m S??ch");
		lblTieuDe.setFont(new Font("Time New Roman",Font.BOLD,20));
		pnTieuDe.add(lblTieuDe);


		pnHinhAnh = new JPanel();
		//pnHinhAnh.setLayout(new BoxLayout(pnHinhAnh, BoxLayout.X_AXIS));
		//pnHinhAnh.setPreferredSize(new Dimension(250,160));
		//pnHinhAnh.setBackground(Color.YELLOW);
		lblHinhAnh = new JLabel("");

		String path = s.getHinhAnh();

		
		//lblHinhAnh.setFont(new Font("Arial", Font.PLAIN, 16));
		lblHinhAnh.setLayout(new FlowLayout(FlowLayout.CENTER));
		lblHinhAnh.setIcon(ResizeImage("img\\\\chuacohinhanh.png"));
		lblHinhAnh.setText(hinhAnh);
		lblHinhAnh.setPreferredSize(new Dimension(250,160));
		lblHinhAnh.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));
		pnHinhAnh.add(lblHinhAnh);


		JPanel pnChonAnh = new JPanel();
		//pnChonAnh.setBackground(Color.PINK);
		lblChonAnh = new JLabel("  Ch???n ???nh");
		lblChonAnh.setFont(new Font("Arial", Font.BOLD, 16));
		btnChonAnh = new JButton("");
		JLabel lblImgChonAnh = new JLabel(ResizeImageIcon("Icon/upload1.png"));
		btnChonAnh.setLayout(new BorderLayout());
		btnChonAnh.add(lblImgChonAnh,BorderLayout.WEST);
		btnChonAnh.add(lblChonAnh,BorderLayout.CENTER);
		btnChonAnh.setBackground(new Color(255, 113, 51));
		lblChonAnh.setForeground(Color.WHITE);
		pnChonAnh.add(btnChonAnh);

		pnNorth.add(pnTieuDe);
		pnNorth.add(pnHinhAnh);
		pnNorth.add(pnChonAnh);

		jDialog.add(pnNorth,BorderLayout.NORTH);


		//CENTER
		JPanel pnCenter = new JPanel();
		//pnCenter.setLayout(new BoxLayout(pnCenter, BoxLayout.Y_AXIS));

		JPanel pnThongTin = new JPanel();
		pnThongTin.setLayout(new BoxLayout(pnThongTin, BoxLayout.Y_AXIS));		
		pnThongTin.add(Box.createVerticalStrut(10));

		Font fontLbl =new Font("Arial",Font.BOLD,18);

		JPanel pnMaSachTacGia = new JPanel();
		pnMaSachTacGia.setLayout(new FlowLayout(FlowLayout.LEFT));
		JLabel lblmaSach = new JLabel("M?? s??ch: ");
		lblmaSach.setFont(fontLbl);
		txtMaSach = new JTextField(20);
		txtMaSach.setFont(new Font("Arial", Font.PLAIN, 16));
		txtMaSach.setEditable(false);
		pnMaSachTacGia.add(lblmaSach);
		pnMaSachTacGia.add(txtMaSach);
		pnMaSachTacGia.add(Box.createHorizontalStrut(10));
		JLabel lblTacGia = new JLabel("T??c gi???: ");
		lblTacGia.setFont(fontLbl);
		txtTacGia = new JTextField(20);
		txtTacGia.setFont(new Font("Arial", Font.PLAIN, 16));
		//txtTacGia.se	tEditable(false);
		pnMaSachTacGia.add(lblTacGia); 
		pnMaSachTacGia.add(txtTacGia);

		JPanel pnTenSach = new JPanel();
		pnTenSach.setLayout(new FlowLayout(FlowLayout.LEFT));
		JLabel lblTenSach = new JLabel("T??n s??ch: ");
		lblTenSach.setFont(fontLbl);
		txtTenSach = new JTextArea(3, 41/2);
		txtTenSach.setFont(new Font("Arial", Font.PLAIN, 16));
		txtTenSach.requestFocus();
		txtTenSach.setLineWrap(true);
		txtTenSach.setWrapStyleWord(true);

		JLabel lblNhaXuatBan = new JLabel("Nh?? xu???t b???n: ");
		lblNhaXuatBan.setFont(fontLbl);
		cbxNhaXuatBan = new JComboBox();
		cbxNhaXuatBan.setEditable(true);
		loadComboNhaXuatBan();
		cbxNhaXuatBan.setPreferredSize(new Dimension(258,25));

		pnTenSach.add(lblTenSach);
		pnTenSach.add(txtTenSach);
		pnTenSach.add(Box.createHorizontalStrut(15));
		pnTenSach.add(lblNhaXuatBan);
		pnTenSach.add(cbxNhaXuatBan);

		JPanel pnLoiDonGia = new JPanel();
		pnLoiDonGia.setLayout(new FlowLayout(FlowLayout.LEFT));	
		 txtLoiDonGia = new JTextField(20);	
		txtLoiDonGia.setBorder(null);
		txtLoiDonGia.setFont(new Font("Arial", Font.ITALIC, 14));
		txtLoiDonGia.setEditable(false);		

		txtLoiNamXuatBan = new JTextField(20);	
		txtLoiNamXuatBan.setBorder(null);
		txtLoiNamXuatBan.setFont(new Font("Arial", Font.ITALIC, 14));
		txtLoiNamXuatBan.setEditable(false);	

		pnLoiDonGia.add(Box.createHorizontalStrut(125));
		pnLoiDonGia.add(txtLoiDonGia);
		pnLoiDonGia.add(Box.createHorizontalStrut(165));
		pnLoiDonGia.add(txtLoiNamXuatBan);

		JPanel pnDonGia = new JPanel();
		pnDonGia.setLayout(new FlowLayout(FlowLayout.LEFT));
		JLabel lblDonGia = new JLabel("????n Gi??: ");
		lblDonGia.setFont(fontLbl);
		txtDonGia = new JTextField(20);
		txtDonGia.setFont(new Font("Arial", Font.PLAIN, 16));
		txtDonGia.addKeyListener(new KeyListener() {

			@Override
			public void keyTyped(KeyEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void keyReleased(KeyEvent e) {
				String donGia = txtDonGia.getText().replaceAll(",", "");
				if(txtDonGia.getText().equals("")) {
					txtLoiDonGia.setText("");
				}						
				else if(!kiemTraNhapSoThuc(donGia) ) {
					txtDonGia.setForeground(Color.red);
					txtLoiDonGia.setText("*L???i: ????n gi?? ph???i l?? s???");
					txtLoiDonGia.setForeground(Color.red);
				}
				else {
					txtDonGia.setForeground(Color.black);
					txtLoiDonGia.setText("");
					double money;
					NumberFormat num = NumberFormat.getNumberInstance();
					try {
						money = num.parse(txtDonGia.getText()).doubleValue();
						txtDonGia.setText(num.format(money));
						double cusMoney = 0;
						if (!txtDonGia.getText().equalsIgnoreCase(""))		
							cusMoney = num.parse(txtDonGia.getText()).doubleValue();
					} 
					catch (ParseException e3) {
						// TODO: handle exception
						e3.printStackTrace();
					}
					catch (NumberFormatException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub

			}
		});

		JLabel lblNamXuatBan = new JLabel("N??m xu???t b???n: ");
		lblNamXuatBan.setFont(fontLbl);
		LocalDateTime localDate = LocalDateTime.now();
		int year = localDate.getYear();
		cbxNamXuatBan = new JComboBox();
		cbxNamXuatBan.setEditable(true);
		for (int i =  year; i >= 1980; i--) {
			cbxNamXuatBan.addItem(String.valueOf(i));
		}
		cbxNamXuatBan.setPreferredSize(new Dimension(258,25));
		cbxNamXuatBan.getEditor().getEditorComponent().addKeyListener(new KeyAdapter() {
			//			public void keyPressed(KeyEvent event) { 
			//
			//				System.out.println("hahahihi");
			//				if(cbxNamXuatBan.getSelectedItem().equals("")) {
			//					txtLoiNamXuatBan.setText("");
			//				}			
			//				else if(!kiemTraNhapSoNguyen((String) cbxNamXuatBan.getSelectedItem()) ) {
			//					System.out.println("haha");
			//					cbxNamXuatBan.setForeground(Color.red);
			//					txtLoiNamXuatBan.setText("*L???i: N??m xu???t b???n ph???i l?? s??? nguy??n");
			//					txtLoiNamXuatBan.setForeground(Color.red);
			//				}
			//				else {
			//					cbxNamXuatBan.setForeground(Color.black);
			//					txtLoiNamXuatBan.setText("");
			//				}
			//			}

			@Override
			public void keyReleased(KeyEvent event) {
				if (event.getKeyCode() == KeyEvent.VK_ENTER) {
			
					if(cbxNamXuatBan.getSelectedItem().equals("")) {
						txtLoiNamXuatBan.setText("");
					}			
					else if(!kiemTraNhapSoNguyen((String) cbxNamXuatBan.getSelectedItem()) ) {
						System.out.println("haha");
						cbxNamXuatBan.setForeground(Color.red);
						txtLoiNamXuatBan.setText("*L???i: N??m xu???t b???n ph???i l?? s??? nguy??n");
						txtLoiNamXuatBan.setForeground(Color.red);
					}
					else {
						cbxNamXuatBan.setForeground(Color.black);
						txtLoiNamXuatBan.setText("");
					}
				}
			}

		});

		pnDonGia.add(lblDonGia);
		pnDonGia.add(txtDonGia);
		pnDonGia.add(Box.createHorizontalStrut(10));
		pnDonGia.add(lblNamXuatBan);
		pnDonGia.add(cbxNamXuatBan);

		JPanel pnLoiTrang = new JPanel();
		pnLoiTrang.setLayout(new FlowLayout(FlowLayout.LEFT));	
		txtLoiTrang = new JTextField(20);	
		txtLoiTrang.setBorder(null);
		txtLoiTrang.setFont(new Font("Arial", Font.ITALIC, 14));
		txtLoiTrang.setEditable(false);		
		pnLoiTrang.add(Box.createHorizontalStrut(550));
		pnLoiTrang.add(txtLoiTrang);

		JPanel pnNhaCungCap = new JPanel();
		pnNhaCungCap.setLayout(new FlowLayout(FlowLayout.LEFT));
		JLabel lblNhaCungCap = new JLabel("Nh?? cung c???p: ");
		lblNhaCungCap.setFont(fontLbl);
		cbxNhaCungCap = new JComboBox();
		cbxNhaCungCap.setEditable(true);
		List<String> listNCC = new ArrayList<String>();
		for(Sach sach : listSach) {  
			listNCC.add(sach.getNhaCungCap().trim());
		}
		Set<String> listNhaCungCapKhongTrung =  new LinkedHashSet<String>(listNCC);
		for(String s : listNhaCungCapKhongTrung) {  
			cbxNhaCungCap.addItem(s);
		}
		cbxNhaCungCap.setPreferredSize(new Dimension(258,25));
		JLabel lblSoTrang = new JLabel("S??? trang: ");
		lblSoTrang.setFont(fontLbl);
		txtSoTrang = new JTextField(20);
		txtSoTrang.setFont(new Font("Arial", Font.PLAIN, 16));
		txtSoTrang.addKeyListener(new KeyListener() {

			@Override
			public void keyTyped(KeyEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void keyReleased(KeyEvent e) {
				// TODO Auto-generated method stub
				if(txtSoTrang.getText().equals("")) {
					txtLoiTrang.setText("");
				}			
				else if(!kiemTraNhapSoNguyen(txtSoTrang.getText()) ) {
					txtSoTrang.setForeground(Color.red);
					txtLoiTrang.setText("*L???i: S??? trang ph???i l?? s??? nguy??n");
					txtLoiTrang.setForeground(Color.red);
				}
				else {
					txtSoTrang.setForeground(Color.black);
					txtLoiTrang.setText("");
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub

			}
		});
		//txtSoTrang.setEditable(false);
		pnNhaCungCap.add(lblNhaCungCap);
		pnNhaCungCap.add(cbxNhaCungCap);
		pnNhaCungCap.add(Box.createHorizontalStrut(10));
		pnNhaCungCap.add(lblSoTrang);
		pnNhaCungCap.add(txtSoTrang);



		JPanel pnLoi = new JPanel();
		pnLoi.setLayout(new FlowLayout(FlowLayout.LEFT));	
		txtLoi = new JTextField(20);
		txtLoi.setBorder(null);
		txtLoi.setFont(new Font("Arial", Font.ITALIC, 14));
		txtLoi.setEditable(false);
		pnLoi.add(Box.createHorizontalStrut(550));
		pnLoi.add(txtLoi);

		JPanel pnSoLuongTon = new JPanel();
		pnSoLuongTon.setLayout(new FlowLayout(FlowLayout.LEFT));
		JLabel lblTheLoai = new JLabel("Th??? lo???i: ");
		lblTheLoai.setFont(fontLbl);
		cbxTheLoai = new JComboBox();
		listLoaiSach = daoLoaiSach.getAllLoaiSach();
		List<String> listTheLoai = new ArrayList<String>();
		for(LoaiSach loaisach : listLoaiSach) {  
			listTheLoai.add(loaisach.getTenLoaiSach());
		}

		Set<String> listTheLoaiKhongTrung =  new LinkedHashSet<String>(listTheLoai);
		for(String s : listTheLoaiKhongTrung) {  
			cbxTheLoai.addItem(s);
		}
		cbxTheLoai.setPreferredSize(new Dimension(258,25));

		pnSoLuongTon.add(lblTheLoai);
		pnSoLuongTon.add(cbxTheLoai);
		pnSoLuongTon.add(Box.createHorizontalStrut(10));
		JLabel lblSoLuongTon = new JLabel("S??? l?????ng t???n: ");
		lblSoLuongTon.setFont(fontLbl);
		txtSoLuongTon = new JTextField(20);	
		txtSoLuongTon.setFont(new Font("Arial", Font.PLAIN, 16));
		txtSoLuongTon.addKeyListener(new KeyListener() {


			@Override
			public void keyTyped(KeyEvent e) {
				// TODO Auto-generated method stub

			}

			@Override
			public void keyReleased(KeyEvent e) {
				// TODO Auto-generated method stub
				if(txtSoLuongTon.getText().equals("")) {
					txtLoi.setText("");
				}
				else if(!kiemTraNhapSoNguyen(txtSoLuongTon.getText()) ) {
					txtSoLuongTon.setForeground(Color.red);
					//txtLoi = new JTextField(20);
					txtLoi.setText("*L???i: S??? l?????ng t???n ph???i l?? s??? nguy??n");
					txtLoi.setForeground(Color.red);
				}
				else {
					txtSoLuongTon.setForeground(Color.black);
					txtLoi.setText("");
				}
			}

			@Override
			public void keyPressed(KeyEvent e) {
				// TODO Auto-generated method stub

			}
		});

		pnSoLuongTon.add(lblSoLuongTon);
		pnSoLuongTon.add(txtSoLuongTon);		

		JPanel pnChucNang = new JPanel();
		pnChucNang.setLayout(new FlowLayout(FlowLayout.RIGHT));
		JLabel lblLuu = new JLabel("L??u");
		lblLuu.setFont(new Font("Arial", Font.BOLD, 16));
		btnLuu = new JButton("");

		btnLuu.setBackground(new Color(255, 113, 51));
		lblLuu.setForeground(Color.WHITE);
		btnLuu.add(lblLuu);
		JLabel lblLamMoi = new JLabel("L??m m???i");
		lblLamMoi.setFont(new Font("Arial", Font.BOLD, 16));
		btnLamMoi = new JButton("");
		btnLamMoi.setBackground(new Color(255, 113, 51));
		lblLamMoi.setForeground(Color.WHITE);
		btnLamMoi.add(lblLamMoi);
		pnChucNang.add(btnLamMoi);
		pnChucNang.add(btnLuu);

		btnLamMoi.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnLuu.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnChonAnh.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

		lblmaSach.setPreferredSize(lblNhaCungCap.getPreferredSize());
		lblTenSach.setPreferredSize(lblNhaCungCap.getPreferredSize());
		lblDonGia.setPreferredSize(lblNhaCungCap.getPreferredSize());
		lblTheLoai.setPreferredSize(lblNhaCungCap.getPreferredSize());

		lblTacGia.setPreferredSize(lblNamXuatBan.getPreferredSize());
		lblNhaXuatBan.setPreferredSize(lblNamXuatBan.getPreferredSize());
		lblSoTrang.setPreferredSize(lblNamXuatBan.getPreferredSize());
		lblSoLuongTon.setPreferredSize(lblNamXuatBan.getPreferredSize());


		pnThongTin.add(pnMaSachTacGia);
		pnThongTin.add(Box.createVerticalStrut(15));
		pnThongTin.add(pnTenSach);
		pnThongTin.add(Box.createVerticalStrut(15));
		pnThongTin.add(pnDonGia);
		pnThongTin.add(pnLoiDonGia);
		pnThongTin.add(Box.createVerticalStrut(-5));
		pnThongTin.add(pnNhaCungCap);
		pnThongTin.add(pnLoiTrang);
		pnThongTin.add(Box.createVerticalStrut(-5));
		pnThongTin.add(pnSoLuongTon);
		pnThongTin.add(pnLoi);
		pnThongTin.add(Box.createVerticalStrut(15));
		pnThongTin.add(pnChucNang);

		pnCenter.add(pnThongTin);

		jDialog.add(pnCenter, BorderLayout.CENTER);


		btnChonAnh.addActionListener(this);
		btnLamMoi.addActionListener(this);
		btnChonAnh.addMouseListener(this);
		btnLuu.addActionListener(this);
		//txtTenSach.addKeyListener(this);
		//txtNamXuatBan.addKeyListener(this);
		//txtTenSach.addKeyListener(new KeyTextArea(txtTenSach,1));
		dinhDangMaSach();

		jDialog.addWindowListener(new WindowAdapter() {
			//M??? l??n l?? load
			@Override
			public void windowOpened(WindowEvent e) {
				DecimalFormat formatter = new DecimalFormat("###,###,###");
				thongTinSach = new LuuThongTinSach();
				txtTenSach.requestFocus();
				Sach sach = new Sach();
				try {
					thongTinSach = (LuuThongTinSach) ResourceManager.load("luuThongTinSach");
					//Ki???m tra kh??ng c?? s??ch th?? l??u, c?? s??ch th?? load t??? file l??n
					//if(sachDao.LaySachTheoTenSach(thongTinSach.tenSanPham.trim())==null) {
					System.out.println(thongTinSach.hinhAnh);
					lblHinhAnh.setIcon(ResizeImage("img\\\\"+XuLyLayTenAnh(DinhDanhLaiNguonAnh(thongTinSach.hinhAnh))));
					txtTenSach.setText(thongTinSach.tenSanPham);
					txtTenSach.requestFocus();
					txtTacGia.setText(thongTinSach.tacGia);
					//cbxNamXuatBan.setSelectedItem(String.valueOf(thongTinSach.namXuatBan));
					txtDonGia.setText(String.valueOf(thongTinSach.donGia));
					//cbxNhaXuatBan.setSelectedItem(thongTinSach.nhaXuatBan);
					//cbxNhaCungCap.setSelectedItem(thongTinSach.nhaCungCap);
					txtSoTrang.setText(String.valueOf(thongTinSach.soTrang));
					cbxTheLoai.setSelectedItem(String.valueOf(thongTinSach.theLoai));
					txtSoLuongTon.setText(String.valueOf(thongTinSach.soLuongThem));
					String donGia = txtDonGia.getText().replaceAll(",", "");
					if(!kiemTraNhapSoNguyen(txtSoTrang.getText()) ) {
						txtSoTrang.setForeground(Color.red);
					}
					else {
						txtSoTrang.setForeground(Color.black);
					}

					if(!kiemTraNhapSoNguyen(txtSoLuongTon.getText()) ) {
						txtSoLuongTon.setForeground(Color.red);
					}
					else {
						txtSoLuongTon.setForeground(Color.black);
					}
					if(!kiemTraNhapSoThuc(donGia) ) {
						txtDonGia.setForeground(Color.red);
					}
					else {
						txtDonGia.setForeground(Color.black);
					}
				} catch (EOFException e1) {
					// ... this is fine
				} catch(IOException e2) {
					// handle exception which is not expected
					e2.printStackTrace(); 
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			}

			@Override
			public void windowClosing(WindowEvent e) {
				saveData();

			}
		});
		jDialog.setVisible(true);
	}
	public static void main(String[] args) {
		//new FormThemSach().setVisible(true);
	}
	public void loadComboNhaXuatBan() {
		List<String> l = new ArrayList<String>();
		for(Sach sach : listSach) {  
			l.add(sach.getNhaXuatBan().trim());
		}
		Set<String> listNXBKhongTrung =  new LinkedHashSet<String>(l);
		for(String s : listNXBKhongTrung) {  
			cbxNhaXuatBan.addItem(s);
		}
	}
	public ImageIcon ResizeImage(String ImagePath)
	{
		ImageIcon MyImage = new ImageIcon(ImagePath);
		Image img = MyImage.getImage();
		Image newImg = img.getScaledInstance(250, 160, Image.SCALE_SMOOTH);
		ImageIcon image = new ImageIcon(newImg);
		return image;
	}
	public ImageIcon ResizeImageIcon(String ImagePath)
	{
		ImageIcon MyImage = new ImageIcon(ImagePath);
		Image img = MyImage.getImage();
		Image newImg = img.getScaledInstance(30, 30, Image.SCALE_SMOOTH);
		ImageIcon image = new ImageIcon(newImg);
		return image;
	}
	private boolean kiemTraNhapSoNguyen(String nhap) {
		try {
			int a = Integer.parseInt(nhap);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	private boolean kiemTraNhapSoThuc(String nhap) {
		try {
			double a = Double.parseDouble(nhap);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean kiemTraNhapLieu() {
		LocalDateTime localDate = LocalDateTime.now();
		int year = localDate.getYear();
		if(txtTenSach.getText().trim().length()==0) {
			txtTenSach.requestFocus();
			JOptionPane.showMessageDialog(this, "T??n s??ch kh??ng ??c tr???ng");
			return false;
		}
		else if(txtTacGia.getText().trim().length()==0) {
			txtTacGia.requestFocus();
			JOptionPane.showMessageDialog(this, "T??c gi??? kh??ng ??c tr???ng");
			return false;
		}
		//		else if(cbxNamXuatBan.getSelectedItem().equals("")) {
		//			cbxNamXuatBan.requestFocus();
		//			JOptionPane.showMessageDialog(this, "N??m xu???t b???n kh??ng ??c tr???ng");
		//			return false;
		//		}
		else if(!kiemTraNhapSoNguyen((String) cbxNamXuatBan.getSelectedItem()) ) {
			cbxNamXuatBan.requestFocus();	
			JOptionPane.showMessageDialog(jDialog,"N??m xu???t b???n ph???i l?? s??? nguy??n !");
			return false;
		}
		//		else if(Integer.parseInt((String) cbxNamXuatBan.getSelectedItem()) < 1900 || Integer.parseInt((String) cbxNamXuatBan.getSelectedItem()) > year) {
		//			cbxNamXuatBan.requestFocus();
		//			JOptionPane.showMessageDialog(this,"N??m xu???t b???n ph???i l???n h??n 1900 v?? nh??? h??n " + year);
		//			return false;
		//		}
		else if(txtDonGia.getText().trim().length()==0) {
			txtDonGia.requestFocus();
			JOptionPane.showMessageDialog(this, "????n gi?? kh??ng ??c tr???ng");
			return false;
		}
		else if(txtDonGia.getText().length()>9&&Float.parseFloat(txtDonGia.getText())>999999999) {
			txtDonGia.requestFocus();
			txtDonGia.selectAll();
			JOptionPane.showMessageDialog(this,"????n gi?? qu?? l???n !");
			return false;
		}
		else if(cbxNamXuatBan.getSelectedItem().equals("")) {
			cbxNamXuatBan.requestFocus();
			JOptionPane.showMessageDialog(this, "N??m xu???t b???n kh??ng ??c tr???ng");
			return false;
		}
		else if(cbxNhaCungCap.getSelectedItem().equals("")) {
			JOptionPane.showMessageDialog(this, "Nh?? cung c???p kh??ng ??c tr???ng");
			return false;
		}
		else if(txtSoTrang.getText().trim().length()==0) {
			txtSoTrang.requestFocus();
			JOptionPane.showMessageDialog(this, "S??? trang kh??ng ??c tr???ng");
			return false;
		}
		else if(!kiemTraNhapSoNguyen(txtSoTrang.getText())) {
			txtSoTrang.requestFocus();
			JOptionPane.showMessageDialog(this, "S??? trang ph???i l?? s??? nguy??n");
			return false;
		}
		else if(txtSoLuongTon.getText().trim().length()==0) {
			txtSoLuongTon.requestFocus();
			JOptionPane.showMessageDialog(this, "S??? l?????ng t???n kh??ng ??c tr???ng");
			return false;
		}
		else if(!kiemTraNhapSoNguyen(txtSoLuongTon.getText())) {
			txtSoLuongTon.requestFocus();
			JOptionPane.showMessageDialog(this, "S??? l?????ng t???n ph???i l?? s??? nguy??n");
			return false;
		}

		return true;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj.equals(btnChonAnh)) {
			try {
				JFileChooser file = new JFileChooser();
				file.setCurrentDirectory(new File(System.getProperty("user.home")));
				FileNameExtensionFilter filter = new FileNameExtensionFilter("Image files", ImageIO.getReaderFileSuffixes());
				file.addChoosableFileFilter(filter);
				file.setFileFilter(filter);
				int result = file.showSaveDialog(null);
				if(result == JFileChooser.APPROVE_OPTION) {
					File selectedFile = file.getSelectedFile();
					hinhAnh = selectedFile.getAbsolutePath();				
					lblHinhAnh.setIcon(ResizeImage(hinhAnh));		
					//lblHinhAnh.setText(hinhAnh);
				}
			} catch (Exception e2) {
				JOptionPane.showMessageDialog(this, "Vui l??ng ch???n ???nh !");
			}
		}
		else if(obj.equals(btnLuu)) {
			if(kiemTraNhapLieu()) {
				String donGia = txtDonGia.getText().replaceAll(",", "");
				if(!kiemTraNhapSoThuc(donGia)) {
					txtDonGia.requestFocus();
					JOptionPane.showMessageDialog(this, "????n gi?? ph???i l?? s???");
				}
				else {
					String ncc = (String) cbxNhaCungCap.getSelectedItem();
					String nhaXuatBan = (String) cbxNhaXuatBan.getSelectedItem();
					listLoaiSach = daoLoaiSach.getAllLoaiSach();
					String loaiSach = null;
					for (int i = 0; i < listLoaiSach.size(); i++) {
						if (cbxTheLoai.getSelectedItem().toString()
								.equalsIgnoreCase(listLoaiSach.get(i).getTenLoaiSach())) {
							loaiSach = listLoaiSach.get(i).getMaLoaiSach();
						}
					}
					Sach sach = new Sach();
					if(hinhAnh.trim().equals("img\\chuacohinhanh.png")) {
						sach = new Sach(txtMaSach.getText(), txtTenSach.getText(), Double.parseDouble(donGia), ncc, 
								Integer.parseInt(txtSoLuongTon.getText()), hinhAnh, 
								"S??ch", true, txtTacGia.getText(), Integer.parseInt((String) cbxNamXuatBan.getSelectedItem()), nhaXuatBan, 
								Integer.parseInt(txtSoTrang.getText()), new LoaiSach(loaiSach));
					}
					else {
						sach = new Sach(txtMaSach.getText(), txtTenSach.getText(), Double.parseDouble(donGia), ncc, 
								Integer.parseInt(txtSoLuongTon.getText()), "img\\\\"+XuLyLayTenAnh(DinhDanhLaiNguonAnh(hinhAnh)), 
								"S??ch", true, txtTacGia.getText(), Integer.parseInt((String) cbxNamXuatBan.getSelectedItem()), nhaXuatBan, 
								Integer.parseInt(txtSoTrang.getText()), new LoaiSach(loaiSach));		
						LuuAnh();
					}
					
					sachDao.themSach(sach);
					QuanLiSanPham.taiComBoxNhaXuatBan();				
					JOptionPane.showMessageDialog(this, "Th??m th??nh c??ng");
					//lblHinhAnh.setIcon(ResizeImage(""));
					hinhAnh = "                       Ch??a c?? h??nh ???nh";
					QuanLiSanPham.qlsp.inSach(sach);
					
					jDialog.dispose();
				}
			}
		}
		else if(obj.equals(btnLamMoi)) {
			lblHinhAnh.setIcon(ResizeImage(""));
			lblHinhAnh.setText("                       Ch??a c?? h??nh ???nh");
			txtTenSach.setText("");
			txtTenSach.requestFocus();
			txtTacGia.setText("");
			cbxNamXuatBan.setSelectedItem("2021");
			txtDonGia.setText("");
			txtSoTrang.setText("");
			txtSoLuongTon.setText("");
			cbxNhaXuatBan.setSelectedItem("NXB V??n H???c");
			cbxNhaCungCap.setSelectedItem("Nh?? Xu???t B???n Kim ?????ng");
			cbxTheLoai.setSelectedItem("V??n H???c");
			txtLoi.setText("");
			txtLoiTrang.setText("");
			txtLoiNamXuatBan.setText("");
			txtLoiDonGia.setText("");
		}
	
	}
	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void mouseEntered(MouseEvent e) {

	}
	@Override
	public void mouseExited(MouseEvent e) {		

	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void keyPressed(KeyEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void keyReleased(KeyEvent e) {
		//KiemTraCoThongTinSach();
		//saveData();

	}
	//L??u d??? li???u v??o file 
	public void saveData() {
		LuuThongTinSach thongTinSach = new LuuThongTinSach();
		thongTinSach.hinhAnh = hinhAnh;
		thongTinSach.tenSanPham = txtTenSach.getText();
		thongTinSach.tacGia = txtTacGia.getText();
		//thongTinSach.namXuatBan = (String) cbxNamXuatBan.getSelectedItem();
		thongTinSach.donGia = txtDonGia.getText();
		//thongTinSach.nhaXuatBan = (String) cbxNhaXuatBan.getSelectedItem();
		//thongTinSach.nhaCungCap = (String) cbxNhaCungCap.getSelectedItem();
		thongTinSach.soTrang =  txtSoTrang.getText();
		thongTinSach.soLuongThem =  txtSoLuongTon.getText();
		thongTinSach.theLoai = (String) cbxTheLoai.getSelectedItem();
		try {
			ResourceManager.save(thongTinSach, "luuThongTinSach");
		} catch (Exception e1) {
			//System.out.println(e1.getMessage());
		}
	}

	//	private boolean KiemTraCoThongTinSach() {		//N???u kh??ng c?? th?? t???o m???i
	//		DecimalFormat formatter = new DecimalFormat("###,###,###");
	//		s = new Sach();
	//		if(sachDao.LaySachTheoTenSach(txtTenSach.getText().trim())!=null) {
	//			s = sachDao.LaySachTheoTenSach(txtTenSach.getText().trim());
	//			lblHinhAnh.setIcon(ResizeImage(s.getHinhAnh()));
	//			txtMaSach.setText(s.getMaSanPham());
	//			txtTacGia.setText(s.getTacGia());
	//			txtNamXuatBan.setText(String.valueOf(s.getNamXuatBan()));
	//			txtDonGia.setText(String.valueOf(formatter.format(s.getGiaBan())));
	//			txtDonGia.setForeground(Color.black);
	//			cbxNhaXuatBan.setSelectedItem(s.getNhaXuatBan());
	//			cbxNhaCungCap.setSelectedItem(s.getNhaCungCap());
	//			txtSoTrang.setText(String.valueOf(s.getSoTrang()));
	//			txtSoLuongTon.setText(String.valueOf(s.getSoLuong()));
	//			String tenLoaiSach = null;
	//			listLoaiSach = daoLoaiSach.getAllLoaiSach();
	//			for(LoaiSach loaiSach : listLoaiSach) {
	//				if(s.getLoaiSach().getMaLoaiSach().equals(loaiSach.getMaLoaiSach())) {
	//					tenLoaiSach = loaiSach.getTenLoaiSach();
	//				}
	//			}
	//			cbxTheLoai.setSelectedItem(tenLoaiSach);
	//			//xoaChu(s.getTacGia());
	//			btnChonAnh.setEnabled(false);
	//			txtTacGia.setEditable(false);
	//			txtNamXuatBan.setEditable(false);
	//			txtDonGia.setEditable(false);
	//			txtSoTrang.setEditable(false);
	//			txtSoLuongTon.setEditable(false);
	//			cbxTheLoai.setEnabled(false);
	//			cbxNhaCungCap.setEnabled(false);
	//			cbxNhaXuatBan.setEnabled(false);
	//
	//			txtSoTrang.setForeground(Color.black);
	//			txtNamXuatBan.setForeground(Color.black);
	//			txtDonGia.setForeground(Color.black);
	//
	//			return true;
	//
	//		}
	//		else {
	//			dinhDangMaSach();
	//			lblHinhAnh.setIcon(ResizeImage(hinhAnh));
	//			txtTacGia.setText("");
	//			txtNamXuatBan.setText("");
	//			txtDonGia.setText("");
	//			txtSoTrang.setText("");
	//			txtSoLuongTon.setText("");
	//			cbxNhaXuatBan.setSelectedItem("NXB V??n H???c");
	//			cbxNhaCungCap.setSelectedItem("Nh?? Xu???t B???n Kim ?????ng");
	//
	//			btnChonAnh.setEnabled(true);
	//			txtTacGia.setEditable(true);
	//			txtNamXuatBan.setEditable(true);
	//			txtDonGia.setEditable(true);
	//			txtSoTrang.setEditable(true);
	//			cbxTheLoai.setEnabled(true);
	//			cbxNhaCungCap.setEnabled(true);
	//			cbxNhaXuatBan.setEnabled(true);
	//			
	//			txtSoTrang.setForeground(Color.black);
	//			txtNamXuatBan.setForeground(Color.black);
	//			txtDonGia.setForeground(Color.black);
	//			return false;
	//		}
	//	}

	private String DinhDanhLaiNguonAnh(String a) {
		String b= "";
		for(int i =0;i<a.length();i++)
		{
			char c = a.charAt(i);
			b+=c;
			if(c=='\\'){
				b+="\\";
			}
		}

		return b;
	}

	private String XuLyLayTenAnh(String nguon) {

		StringBuilder str = new StringBuilder(nguon);
		str = str.reverse();
		String tenAnh="";
		for(int i =0;i<str.length();i++) {
			if(str.charAt(i)=='\\')
				break;
			else
				tenAnh+=str.charAt(i);
		}
		str=new StringBuilder(tenAnh);
		return str.reverse().toString();
	}

	//L??u ???nh v??o th?? m???c img khi th??m
	private void LuuAnh() {
		FileInputStream in = null;
		System.out.println(hinhAnh + "Dong 967");
		try {	
			in = new FileInputStream(DinhDanhLaiNguonAnh(hinhAnh));
			//System.out.println(XuLyLayTenAnh(DinhDanhLaiNguonAnh(hinhAnh)));
			FileOutputStream ou = new FileOutputStream("img\\"+XuLyLayTenAnh(DinhDanhLaiNguonAnh(hinhAnh)));
			BufferedInputStream bin = new BufferedInputStream(in);
			BufferedOutputStream bou = new BufferedOutputStream(ou);
			int b= 0;
			while(b!=-1) {
				try {
					b = bin.read();
					bou.write(b);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				System.out.println(b + "Dong 983");
				System.out.println(bou + "Dong 984");
			}
			try {
				bin.close();
				bou.close();
			}  catch(IOException e2) {
				// handle exception which is not expected
				e2.printStackTrace(); 
			} 

			System.out.println("Copy th??nh c??ng");
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			//SachTrongQLSP.lblHinhAnh.setText(hinhAnh);
			//System.out.println(hinhAnh);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	private void dinhDangMaSach() {
		String maSach = "";
		maSach += "SPS";
		if(String.valueOf(sachDao.layMaSachLonNhat()).length() == 2) {
			maSach += "00";
		}
		else if(String.valueOf(sachDao.layMaSachLonNhat()).length() == 3) {
			maSach += "0";
		}
		else if(String.valueOf(sachDao.layMaSachLonNhat()).length() == 1) {
			maSach += "000";
		}
		maSach += String.valueOf(sachDao.layMaSachLonNhat()+1);
		txtMaSach.setText(maSach);
	}

}
