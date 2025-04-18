package frmQLCafe;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import java.io.Serializable;
import javax.swing.border.TitledBorder;
import javax.swing.JTextField;
import javax.swing.JTable;
import javax.swing.JButton;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
import java.util.Vector;
import javax.swing.JFileChooser;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JOptionPane;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class frmQuanLySanPham extends JFrame implements Serializable {

    private static final long serialVersionUID = 1L;
    private JTextField txtTenSanPham;
    private JTextField txtGia;
    private JTable tableSanPham;
    
    // Remove these lines
    // private static final String URL = "jdbc:mariadb://localhost:3306/cafe";
    // private static final String USER = "root"; 
    // private static final String PASSWORD = "root"; 

    private JTextField textFieldImagePath;
    private JTextField txtMaSP;

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    frmQuanLySanPham window = new frmQuanLySanPham();
                    window.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public frmQuanLySanPham() {
        getContentPane().setBackground(new Color(255, 255, 255));
        initialize();
        loadDataToTable();
    }

    private void initialize() {
        getContentPane().setBackground(new Color(255, 255, 255));
        setBounds(100, 100, 803, 569);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(null);
        setResizable(false); // Không cho phép thay đổi kích thước
        setLocationRelativeTo(null); // Căn giữa màn hình

        JPanel panel = new JPanel();
        panel.setLayout(null);
        panel.setBackground(Color.BLACK);
        panel.setBounds(-1, 0, 790, 51);
        getContentPane().add(panel);

        JLabel lblSnPhm = new JLabel("SẢN PHẨM");
        lblSnPhm.setForeground(Color.WHITE);
        lblSnPhm.setFont(new Font("Tahoma", Font.BOLD, 20));
        lblSnPhm.setBounds(342, 10, 117, 31);
        panel.add(lblSnPhm);

        JPanel panel_1 = new JPanel();
        panel_1.setBackground(new Color(255, 255, 255));
        panel_1.setBorder(new TitledBorder(null, "Danh S\u00E1ch S\u1EA3n Ph\u1EA9m", TitledBorder.LEADING, TitledBorder.TOP, null, null));
        panel_1.setBounds(-1, 51, 790, 432);
        getContentPane().add(panel_1);
        panel_1.setLayout(null);

        JLabel lblNewLabel_1 = new JLabel("Tên Sản Phẩm:");
        lblNewLabel_1.setForeground(Color.BLACK);
        lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblNewLabel_1.setBounds(10, 80, 179, 22);
        panel_1.add(lblNewLabel_1);

        JLabel lblNewLabel_1_1 = new JLabel("Giá:");
        lblNewLabel_1_1.setForeground(Color.BLACK);
        lblNewLabel_1_1.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblNewLabel_1_1.setBounds(10, 112, 179, 22);
        panel_1.add(lblNewLabel_1_1);

        txtTenSanPham = new JTextField();
        txtTenSanPham.setColumns(10);
        txtTenSanPham.setBounds(199, 83, 581, 19);
        panel_1.add(txtTenSanPham);

        txtGia = new JTextField();
        txtGia.setColumns(10);
        txtGia.setBounds(199, 115, 581, 19);
        panel_1.add(txtGia);

        JScrollPane scrollPane = new JScrollPane();
        scrollPane.setBounds(10, 193, 770, 190);
        panel_1.add(scrollPane);

        tableSanPham = new JTable();
        tableSanPham.setBackground(new Color(242, 242, 242));
        scrollPane.setViewportView(tableSanPham);

        JButton btnThemSP = new JButton("Thêm Sản Phẩm");
        btnThemSP.setForeground(Color.WHITE);
        btnThemSP.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnThemSP.setBackground(Color.BLACK);
        btnThemSP.setBounds(20, 393, 155, 29);
        panel_1.add(btnThemSP);

        btnThemSP.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                themSanPham();
                loadDataToTable();
            }
        });

        JButton btnSuaSP = new JButton("Sửa Sản Phẩm");
        btnSuaSP.setForeground(Color.WHITE);
        btnSuaSP.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnSuaSP.setBackground(Color.BLACK);
        btnSuaSP.setBounds(221, 393, 155, 29);
        panel_1.add(btnSuaSP);

        JButton btnXoaSP = new JButton("Xóa Sản Phẩm");
        btnXoaSP.setForeground(Color.WHITE);
        btnXoaSP.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnXoaSP.setBackground(Color.BLACK);
        btnXoaSP.setBounds(423, 393, 155, 29);
        panel_1.add(btnXoaSP);

        JLabel lblMaSP = new JLabel("Mã SP:");
        lblMaSP.setForeground(Color.BLACK);
        lblMaSP.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblMaSP.setBounds(10, 48, 179, 22);
        panel_1.add(lblMaSP);

        txtMaSP = new JTextField();
        txtMaSP.setEditable(false);
        txtMaSP.setColumns(10);
        txtMaSP.setBounds(199, 51, 581, 19);
        panel_1.add(txtMaSP);

        JButton btnXoaTatCa = new JButton("Xóa tất cả");
        btnXoaTatCa.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                txtMaSP.setText("");
                txtTenSanPham.setText("");
                txtGia.setText("");
                textFieldImagePath.setText("");
            }
        });

        btnXoaTatCa.setForeground(Color.WHITE);
        btnXoaTatCa.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnXoaTatCa.setBackground(Color.BLACK);
        btnXoaTatCa.setBounds(610, 393, 155, 29);
        panel_1.add(btnXoaTatCa);

        tableSanPham.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                int row = tableSanPham.getSelectedRow();
                if (row >= 0) {
                    DefaultTableModel model = (DefaultTableModel) tableSanPham.getModel();
                    txtMaSP.setText(model.getValueAt(row, 0).toString());
                    txtTenSanPham.setText(model.getValueAt(row, 1).toString());
                    txtGia.setText(model.getValueAt(row, 2).toString());
                    textFieldImagePath.setText(model.getValueAt(row, 3).toString());
                }
            }
        });

        btnSuaSP.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                suaSanPham();
                loadDataToTable();
            }
        });

        btnXoaSP.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                xoaSanPham();
                loadDataToTable();
            }
        });

        JLabel lblNewLabel_1_1_1 = new JLabel("Hình ảnh:");
        lblNewLabel_1_1_1.setForeground(Color.BLACK);
        lblNewLabel_1_1_1.setFont(new Font("Tahoma", Font.BOLD, 12));
        lblNewLabel_1_1_1.setBounds(10, 144, 179, 22);
        panel_1.add(lblNewLabel_1_1_1);

        textFieldImagePath = new JTextField();
        textFieldImagePath.setEditable(true);
        textFieldImagePath.setColumns(10);
        textFieldImagePath.setBounds(199, 144, 456, 19);
        panel_1.add(textFieldImagePath);

        JButton btnChonHinhAnh = new JButton("Chọn Ảnh");
        btnChonHinhAnh.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                int result = fileChooser.showOpenDialog(null);
                if (result == JFileChooser.APPROVE_OPTION) {
                    String selectedFilePath = fileChooser.getSelectedFile().getAbsolutePath();
                    textFieldImagePath.setText(selectedFilePath);
                }
            }
        });
        btnChonHinhAnh.setForeground(Color.WHITE);
        btnChonHinhAnh.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnChonHinhAnh.setBackground(Color.BLACK);
        btnChonHinhAnh.setBounds(665, 143, 115, 21);
        panel_1.add(btnChonHinhAnh);
        
        JButton btnThoat = new JButton("Thoát ");
        btnThoat.setForeground(Color.WHITE);
        btnThoat.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnThoat.setBackground(Color.BLACK);
        btnThoat.setBounds(666, 493, 95, 29);
        getContentPane().add(btnThoat);
        btnThoat.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int confirm = JOptionPane.showConfirmDialog(null, "Bạn có chắc chắn muốn thoát không?", "Xác nhận thoát", JOptionPane.YES_NO_OPTION);
                if (confirm == JOptionPane.YES_OPTION) {
                    dispose();
                }
            }
        });
    }

    private void loadDataToTable() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Mã SP");
        model.addColumn("Tên SP");
        model.addColumn("Giá");
        model.addColumn("Link Ảnh");

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM sanpham")) {

            while (rs.next()) {
                Vector<String> row = new Vector<>();
                row.add(String.valueOf(rs.getInt("MaSanPham")));
                row.add(rs.getString("Ten"));
                row.add(String.valueOf(rs.getDouble("Gia")));
                row.add(rs.getString("LinkSP"));
                model.addRow(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        tableSanPham.setModel(model);
    }

    private void themSanPham() {
        String tenSP = txtTenSanPham.getText();
        double giaSP = Double.parseDouble(txtGia.getText());
        String linkSP = textFieldImagePath.getText();

        String sql = "INSERT INTO sanpham (Ten, Gia, LinkSP) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, tenSP);
            pstmt.setDouble(2, giaSP);
            pstmt.setString(3, linkSP);
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                int maSanPhamMoi = rs.getInt(1);
                frmQuanLyKhoHang khoHang = new frmQuanLyKhoHang();
                khoHang.themSanPhamVaoKho(maSanPhamMoi, 0);
            }

            JOptionPane.showMessageDialog(this, "Thêm sản phẩm thành công!");

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Lỗi khi thêm sản phẩm!", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void suaSanPham() {
        int maSP = Integer.parseInt(txtMaSP.getText());
        String tenSP = txtTenSanPham.getText();
        double giaSP = Double.parseDouble(txtGia.getText());
        String linkSP = textFieldImagePath.getText();

        String sql = "UPDATE sanpham SET Ten = ?, Gia = ?, LinkSP = ? WHERE MaSanPham = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, tenSP);
            pstmt.setDouble(2, giaSP);
            pstmt.setString(3, linkSP);
            pstmt.setInt(4, maSP);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Sửa sản phẩm thành công!");

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Lỗi khi sửa sản phẩm!", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void xoaSanPham() {
        int maSP = Integer.parseInt(txtMaSP.getText());

        String sql = "DELETE FROM sanpham WHERE MaSanPham = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, maSP);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Xóa sản phẩm thành công!");

        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Lỗi khi xóa sản phẩm!", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
