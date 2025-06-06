package frmQLCafe;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.Serializable;
import java.sql.*;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import java.math.BigDecimal;

public class frmQuanLyMuaBan extends JFrame implements Serializable {

    private static final long serialVersionUID = 1L;
    private JTable tableBan;
    private JTable tableKhachHang;
    private DefaultTableModel tableModelBan;
    private DefaultTableModel tableModelKhachHang;
    private Connection connection;
    private JComboBox<String> comboBoxTrangThai;
    @SuppressWarnings("unused")
	private JTextField txtTimKiem;
    private JTextField txtSoDienThoai;
    private JButton btnKiemTraSDT;
    private frmQuanLyDatBan parent;
    private JButton btnCapNhat, btnChonBan, btnGoiMon, btnThoat;

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            try {
                frmQuanLyMuaBan window = new frmQuanLyMuaBan();
                window.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public frmQuanLyMuaBan() {
        initialize();
        connectToDatabase();
        loadBanData();
    }

    private void connectToDatabase() {
        connection = DatabaseConnection.getConnection();
    }

    public frmQuanLyMuaBan(frmQuanLyDatBan parent) {
        this.parent = parent;
        initialize();
        connectToDatabase();
        loadBanData();
    }

    private void initialize() {
        setTitle("Quản lý quán cafe");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setSize(928, 608);
        getContentPane().setBackground(new Color(255, 255, 255));
        getContentPane().setLayout(null);
        setResizable(false); // Không cho phép thay đổi kích thước
        setLocationRelativeTo(null); // Căn giữa màn hình

        JPanel headerPanel = new JPanel();
        headerPanel.setBounds(0, 0, 914, 48);
        headerPanel.setBackground(Color.BLACK);
        headerPanel.setLayout(null);
        JLabel headerLabel = new JLabel("MUA BÁN");
        headerLabel.setBounds(400, 11, 117, 25);
        headerLabel.setForeground(Color.WHITE);
        headerLabel.setFont(new Font("Tahoma", Font.BOLD, 20));
        headerPanel.add(headerLabel);
        getContentPane().add(headerPanel);

        JPanel centerPanel = new JPanel();
        centerPanel.setBounds(0, 45, 914, 437);
        centerPanel.setBackground(new Color(255, 255, 255));

        JScrollPane scrollPaneBan = new JScrollPane();
        scrollPaneBan.setBounds(0, 10, 452, 415);
        tableBan = new JTable() {
            /**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
                Component c = super.prepareRenderer(renderer, row, column);
                String status = (String) getModel().getValueAt(row, 2);
                switch (status) {
                    case "Trống":
                        c.setBackground(Color.GREEN);
                        break;
                    case "Có người":
                        c.setBackground(Color.RED);
                        break;
                    case "Đã đặt":
                        c.setBackground(Color.YELLOW);
                        break;
                    default:
                        c.setBackground(Color.WHITE);
                        break;
                }
                return c;
            }
        };
        tableBan.setBackground(new Color(242, 242, 242));
        scrollPaneBan.setViewportView(tableBan);
        tableModelBan = new DefaultTableModel(
                new Object[][]{},
                new String[]{"Mã Bàn", "Tên Bàn", "Trạng Thái"}
        );
        centerPanel.setLayout(null);
        tableBan.setModel(tableModelBan);
        centerPanel.add(scrollPaneBan);

        JScrollPane scrollPaneKhachHang = new JScrollPane();
        scrollPaneKhachHang.setBounds(462, 10, 452, 415);
        tableKhachHang = new JTable();
        tableKhachHang.setBackground(new Color(242, 242, 242));
        scrollPaneKhachHang.setViewportView(tableKhachHang);
        tableModelKhachHang = new DefaultTableModel(
                new Object[][]{},
                new String[]{"Mã Khách Hàng", "Tên Khách Hàng", "Số Điện Thoại"}
        );
        tableKhachHang.setModel(tableModelKhachHang);
        centerPanel.add(scrollPaneKhachHang);

        getContentPane().add(centerPanel);

        JPanel controlPanel = new JPanel();
        controlPanel.setBounds(0, 480, 914, 91);
        controlPanel.setBackground(new Color(255, 255, 255));
        getContentPane().add(controlPanel);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        GridBagConstraints gbcLblTrangThai = (GridBagConstraints) gbc.clone();
        gbcLblTrangThai.gridx = 0;
        gbcLblTrangThai.gridy = 0;
        controlPanel.setLayout(null);
        JLabel lblTrangThai = new JLabel("Trạng thái:");
        lblTrangThai.setBounds(79, 15, 96, 15);
        lblTrangThai.setFont(new Font("Tahoma", Font.BOLD, 12));
        controlPanel.add(lblTrangThai);

        GridBagConstraints gbcComboBoxTrangThai = (GridBagConstraints) gbc.clone();
        gbcComboBoxTrangThai.gridx = 1;
        comboBoxTrangThai = new JComboBox<>(new String[]{"Trống", "Có người", "Đã đặt"});
        comboBoxTrangThai.setBackground(new Color(255, 255, 255));
        comboBoxTrangThai.setBounds(185, 10, 117, 27);
        controlPanel.add(comboBoxTrangThai);

        GridBagConstraints gbcBtnCapNhat = (GridBagConstraints) gbc.clone();
        gbcBtnCapNhat.gridx = 2;
        btnCapNhat = new JButton("Cập nhật");
        btnCapNhat.setBounds(312, 10, 124, 27);
        btnCapNhat.setForeground(Color.WHITE);
        btnCapNhat.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnCapNhat.setBackground(Color.BLACK);
        btnCapNhat.addActionListener(e -> capNhatTrangThaiBan());
        controlPanel.add(btnCapNhat);
        /*
        GridBagConstraints gbcLblTimKiem = (GridBagConstraints) gbc.clone();
        gbcLblTimKiem.gridx = 3;
        JLabel lblTimKiem = new JLabel("Tìm kiếm:");
        lblTimKiem.setBounds(487, 15, 71, 15);
        lblTimKiem.setFont(new Font("Tahoma", Font.BOLD, 12));
        controlPanel.add(lblTimKiem);
		*/
        
        /*
        GridBagConstraints gbcTxtTimKiem = (GridBagConstraints) gbc.clone();
        gbcTxtTimKiem.gridx = 4;
        txtTimKiem = new JTextField(10);
        txtTimKiem.setBounds(568, 14, 141, 19);
        txtTimKiem.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                timKiemBan();
            }
        });
        controlPanel.add(txtTimKiem);
        */

        GridBagConstraints gbcLblSoDienThoai = (GridBagConstraints) gbc.clone();
        gbcLblSoDienThoai.gridx = 0;
        gbcLblSoDienThoai.gridy = 1;
        JLabel lblSoDienThoai = new JLabel("Số điện thoại:");
        lblSoDienThoai.setBounds(79, 58, 96, 15);
        lblSoDienThoai.setFont(new Font("Tahoma", Font.BOLD, 12));
        controlPanel.add(lblSoDienThoai);

        GridBagConstraints gbcTxtSoDienThoai = (GridBagConstraints) gbc.clone();
        gbcTxtSoDienThoai.gridx = 1;
        txtSoDienThoai = new JTextField(10);
        txtSoDienThoai.setBounds(185, 53, 117, 27);
        controlPanel.add(txtSoDienThoai);

        GridBagConstraints gbcBtnKiemTraSDT = (GridBagConstraints) gbc.clone();
        gbcBtnKiemTraSDT.gridx = 2;
        btnKiemTraSDT = new JButton("Kiểm tra");
        btnKiemTraSDT.setBounds(312, 53, 124, 27);
        btnKiemTraSDT.setForeground(Color.WHITE);
        btnKiemTraSDT.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnKiemTraSDT.setBackground(Color.BLACK);
        btnKiemTraSDT.addActionListener(e -> kiemTraSDT());
        controlPanel.add(btnKiemTraSDT);

        GridBagConstraints gbcBtnChonBan = (GridBagConstraints) gbc.clone();
        gbcBtnChonBan.gridx = 2;
        gbcBtnChonBan.gridy = 2;
        btnChonBan = new JButton("Chọn bàn");
        btnChonBan.setBounds(487, 51, 101, 27);
        btnChonBan.setForeground(Color.WHITE);
        btnChonBan.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnChonBan.setBackground(Color.BLACK);
        btnChonBan.addActionListener(e -> chonBan());
        controlPanel.add(btnChonBan);

        // Thêm nút Gọi Món
        GridBagConstraints gbcBtnGoiMon = (GridBagConstraints) gbc.clone();
        gbcBtnGoiMon.gridx = 3;
        gbcBtnGoiMon.gridy = 2;
        btnGoiMon = new JButton("Gọi Món");
        btnGoiMon.setBounds(608, 51, 101, 27);
        btnGoiMon.setForeground(Color.WHITE);
        btnGoiMon.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnGoiMon.setBackground(Color.BLACK);
        btnGoiMon.addActionListener(e -> goiMon());
        controlPanel.add(btnGoiMon);

        // Thêm nút Thoát
        GridBagConstraints gbcBtnThoat = (GridBagConstraints) gbc.clone();
        gbcBtnThoat.gridx = 4;
        gbcBtnThoat.gridy = 2;
        btnThoat = new JButton("Thoát");
        btnThoat.setBounds(823, 53, 81, 27);
        btnThoat.setForeground(Color.WHITE);
        btnThoat.setFont(new Font("Tahoma", Font.BOLD, 12));
        btnThoat.setBackground(Color.BLACK);
        btnThoat.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int confirm = JOptionPane.showConfirmDialog(null, "Bạn có chắc chắn muốn thoát không?", "Xác nhận thoát", JOptionPane.YES_NO_OPTION);
                if (confirm == JOptionPane.YES_OPTION) {
                    dispose();
                }
            }
        });
        controlPanel.add(btnThoat);

        tableBan.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                int selectedRow = tableBan.getSelectedRow();
                if (selectedRow != -1) {
                    String maBan = tableModelBan.getValueAt(selectedRow, 0).toString();
                    String trangThai = tableModelBan.getValueAt(selectedRow, 2).toString();
                    if (!"Trống".equals(trangThai)) {
                        loadKhachHangData(maBan);
                    } else {
                        tableModelKhachHang.setRowCount(0); // Clear customer data if table is empty
                    }
                }
            }
        });
    }

   

    private void loadBanData() {
        String query = "SELECT MaBan, Ten, TrangThai FROM ban";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            tableModelBan.setRowCount(0);
            while (resultSet.next()) {
                String maBan = resultSet.getString("MaBan");
                String tenBan = resultSet.getString("Ten");
                String trangThai = resultSet.getString("TrangThai");
                tableModelBan.addRow(new Object[]{maBan, tenBan, trangThai});
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadKhachHangData(String maBan) {
        String queryStatus = "SELECT TrangThai FROM ban WHERE MaBan = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(queryStatus)) {
            preparedStatement.setString(1, maBan);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String trangThai = resultSet.getString("TrangThai");
                if (!"Có người".equals(trangThai) && !"Đã đặt".equals(trangThai)) {  // Chỉ thông báo khi trạng thái không phải "Có người" hoặc "Đã đặt"
                    JOptionPane.showMessageDialog(this, "Bàn này không có người.", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                    tableModelKhachHang.setRowCount(0);
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String query = "SELECT kh.MaKhachHang, kh.Ten, kh.DienThoai " +
                       "FROM datcho dc " +
                       "JOIN khachhang kh ON dc.MaKhachHang = kh.MaKhachHang " +
                       "WHERE dc.MaBan = ? AND dc.ThoiGianDat = (SELECT MAX(ThoiGianDat) FROM datcho WHERE MaBan = ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, maBan);
            preparedStatement.setString(2, maBan);
            ResultSet resultSet = preparedStatement.executeQuery();
            tableModelKhachHang.setRowCount(0);
            if (resultSet.next()) {
                String maKhachHang = resultSet.getString("MaKhachHang");
                String ten = resultSet.getString("Ten");
                String dienThoai = resultSet.getString("DienThoai");
                tableModelKhachHang.addRow(new Object[]{maKhachHang, ten, dienThoai});
            } else {
                // Hiển thị thông tin khách hàng vãng lai nếu không có dữ liệu khách hàng
                tableModelKhachHang.addRow(new Object[]{"", "Khách vãng lai", "0000000000"});
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void capNhatTrangThaiBan() {
        int selectedRow = tableBan.getSelectedRow();
        if (selectedRow != -1) {
            String trangThai = (String) comboBoxTrangThai.getSelectedItem();
            String maBan = tableModelBan.getValueAt(selectedRow, 0).toString();
            tableModelBan.setValueAt(trangThai, selectedRow, 2);
            updateBanStatus(maBan, trangThai);
            if (!"Có người".equals(trangThai)) {
                tableModelKhachHang.setRowCount(0); // Clear customer data if table is not occupied
            }
        }
    }
    /*
    private void timKiemBan() {
        String text = txtTimKiem.getText();
        if (text.trim().length() == 0) {
            tableModelBan.setRowCount(0);
            loadBanData();
        } else {
            for (int i = 0; i < tableModelBan.getRowCount(); i++) {
                if (!tableModelBan.getValueAt(i, 1).toString().contains(text)) {
                    tableModelBan.removeRow(i);
                    i--;
                }
            }
        }
    }
	*/
    private void chonBan() {
        int selectedRow = tableBan.getSelectedRow();
        if (selectedRow != -1) {
            String maBan = tableModelBan.getValueAt(selectedRow, 0).toString();
            String tenBan = tableModelBan.getValueAt(selectedRow, 1).toString();
            String trangThai = tableModelBan.getValueAt(selectedRow, 2).toString();
            if ("Trống".equals(trangThai)) {
                parent.setSelectedBan(maBan, tenBan);
                updateBanStatus(maBan, "Đã đặt");
                dispose();
            } else if ("Có người".equals(trangThai)) {
                loadKhachHangData(maBan); // Tải dữ liệu khách hàng khi bàn có người
            } else {
                JOptionPane.showMessageDialog(this, "Bàn này không trống. Vui lòng kiểm tra thông tin khách hàng.", "Thông báo", JOptionPane.WARNING_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một bàn.", "Thông báo", JOptionPane.WARNING_MESSAGE);
        }
    }

    private void updateBanStatus(String maBan, String trangThai) {
        try {
            String query = "UPDATE ban SET TrangThai = ? WHERE MaBan = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, trangThai);
            preparedStatement.setString(2, maBan);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void kiemTraSDT() {
        String soDienThoai = txtSoDienThoai.getText().trim();
        if (soDienThoai.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập số điện thoại.", "Thông báo", JOptionPane.WARNING_MESSAGE);
            return;
        }

        String query = "SELECT kh.MaKhachHang, kh.Ten, kh.DienThoai, dc.MaBan, b.Ten AS TenBan, b.TrangThai " +
                       "FROM datcho dc JOIN ban b ON dc.MaBan = b.MaBan " +
                       "JOIN khachhang kh ON dc.MaKhachHang = kh.MaKhachHang " +
                       "WHERE kh.DienThoai = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, soDienThoai);
            ResultSet resultSet = preparedStatement.executeQuery();
            tableModelKhachHang.setRowCount(0);
            tableModelBan.setRowCount(0);
            if (resultSet.next()) {
                String maKhachHang = resultSet.getString("MaKhachHang");
                String tenKhachHang = resultSet.getString("Ten");
                String dienThoai = resultSet.getString("DienThoai");
                String maBan = resultSet.getString("MaBan");
                String tenBan = resultSet.getString("TenBan");
                String trangThai = resultSet.getString("TrangThai");

                tableModelKhachHang.addRow(new Object[]{maKhachHang, tenKhachHang, dienThoai});
                tableModelBan.addRow(new Object[]{maBan, tenBan, trangThai});

                JOptionPane.showMessageDialog(this, "Khách hàng đã có đặt bàn.", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Khách hàng chưa có đặt bàn.", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void goiMon() {
        int selectedRow = tableBan.getSelectedRow();
        if (selectedRow != -1) {
            String maBan = tableModelBan.getValueAt(selectedRow, 0).toString();
            String trangThai = tableModelBan.getValueAt(selectedRow, 2).toString();
            if ("Trống".equals(trangThai)) {
                frmQuanLyMenu menuForm = new frmQuanLyMenu(new Vector<>(), BigDecimal.ZERO, maBan, false);
                menuForm.setVisible(true);
                updateBanStatus(maBan, "Có người");
                tableModelBan.setValueAt("Có người", selectedRow, 2);
            } else {
                JOptionPane.showMessageDialog(this, "Bàn này không trống. Vui lòng kiểm tra thông tin khách hàng.", "Thông báo", JOptionPane.WARNING_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn một bàn.", "Thông báo", JOptionPane.WARNING_MESSAGE);
        }
    }
}
