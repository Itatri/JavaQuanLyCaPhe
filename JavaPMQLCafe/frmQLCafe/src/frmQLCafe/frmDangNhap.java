package frmQLCafe;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;


public class frmDangNhap {

	private JFrame frame;
	private JTextField txtTaiKhoan;
	//private JTextField txtMatKhau;
	private JPasswordField txtMatKhau;

	   // Thêm biến static để lưu loại tài khoản
    public static String loaiTaiKhoan; // Sử dụng kiểu dữ liệu String

    // Thông tin kết nối cơ sở dữ liệu
    private static final String DB_URL = "jdbc:mariadb://localhost:3306/cafe";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "root";
    
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frmDangNhap window = new frmDangNhap();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}


	public frmDangNhap() {
		initialize();
	}

	
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 741, 445);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(255, 255, 255));
		panel.setBounds(355, 0, 372, 408);
		frame.getContentPane().add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("ĐĂNG NHẬP ");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 30));
		lblNewLabel.setForeground(new Color(128, 64, 0));
		lblNewLabel.setBounds(99, 55, 194, 55);
		panel.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Tài khoản ");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblNewLabel_1.setBounds(30, 137, 70, 19);
		panel.add(lblNewLabel_1);
		
		txtTaiKhoan = new JTextField();
		txtTaiKhoan.setBounds(30, 167, 318, 30);
		panel.add(txtTaiKhoan);
		txtTaiKhoan.setColumns(10);
		
		JLabel lblNewLabel_1_1 = new JLabel("Mật khẩu ");
		lblNewLabel_1_1.setFont(new Font("Tahoma", Font.PLAIN, 15));
		lblNewLabel_1_1.setBounds(30, 222, 70, 19);
		panel.add(lblNewLabel_1_1);
		
		//txtMatKhau = new JTextField();
		txtMatKhau = new JPasswordField();
		txtMatKhau.setColumns(10);
		txtMatKhau.setBounds(30, 251, 318, 30);
		panel.add(txtMatKhau);
		
		JButton btnDangNhap = new JButton("Đăng nhập ");
		btnDangNhap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				   login();
			}
		 
		});
		btnDangNhap.setForeground(new Color(255, 255, 255));
		btnDangNhap.setBackground(new Color(128, 64, 0));
		btnDangNhap.setBounds(131, 332, 112, 30);
		panel.add(btnDangNhap);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(128, 64, 0));
		panel_1.setBounds(0, 0, 355, 408);
		frame.getContentPane().add(panel_1);
		panel_1.setLayout(null);
		
		JLabel lblNewLabel_2 = new JLabel("");
		//lblNewLabel_2.setIcon(new ImageIcon("C:\\Users\\triho\\OneDrive\\Máy tính\\JavaPMQLCafe\\frmQLCafe\\src\\icon\\coffee-shopresize.png"));
		   lblNewLabel_2.setIcon(new ImageIcon(getClass().getResource("/icon/coffee-shopresize.png")));
		lblNewLabel_2.setBounds(63, 71, 200, 200);
		panel_1.add(lblNewLabel_2);
		
		JLabel lblItCoffee = new JLabel("IT COFFEE");
		lblItCoffee.setForeground(new Color(255, 255, 255));
		lblItCoffee.setFont(new Font("Tahoma", Font.BOLD, 30));
		lblItCoffee.setBounds(85, 281, 166, 55);
		panel_1.add(lblItCoffee);
	}
	  // Phần xử lý đăng nhập
    private void login() {
        String username = txtTaiKhoan.getText();
        String password = new String(txtMatKhau.getPassword());

        if (username.isEmpty() || password.isEmpty()) {
            JOptionPane.showMessageDialog(frame, "Vui lòng nhập đầy đủ thông tin!");
            return;
        }

        try {
            Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            String sql = "SELECT LoaiTaiKhoan FROM taikhoan WHERE TenDangNhap = ? AND MatKhau = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Lưu loại tài khoản
                loaiTaiKhoan = resultSet.getString("LoaiTaiKhoan");
                JOptionPane.showMessageDialog(frame, "Đăng nhập thành công!");
                frame.dispose(); // Đóng form đăng nhập
                frmMain.main(null); // Mở form quản lý menu
            } else {
                JOptionPane.showMessageDialog(frame, "Sai tên đăng nhập hoặc mật khẩu!");
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(frame, "Lỗi kết nối cơ sở dữ liệu!");
        }
    }

	}
