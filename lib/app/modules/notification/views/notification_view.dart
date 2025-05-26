import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header with back button, title, and menu
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Notifikasi',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Menu PopupMenuButton
                  Obx(() => PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.black),
                    enabled: !controller.isRefreshing.value, // Disable saat refresh
                    onSelected: (String value) {
                      switch (value) {
                        case 'mark_all_read':
                          controller.markAllAsRead();
                          break;
                        case 'refresh':
                          controller.refreshNotifications();
                          break;
                        case 'delete_all':
                          controller.deleteAllNotifications();
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<String>(
                        value: 'mark_all_read',
                        child: Row(
                          children: [
                            Icon(Icons.mark_email_read, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Tandai Semua Sudah Dibaca'),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'refresh',
                        child: Row(
                          children: [
                            Icon(Icons.refresh, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Refresh Halaman'),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete_all',
                        child: Row(
                          children: [
                            Icon(Icons.delete_forever, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Hapus Semua Notifikasi'),
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),

            // Garis bawah header
            Container(
              height: 1,
              color: Colors.grey.shade200,
            ),

            // Loading indicator saat refresh
            Obx(() => controller.isRefreshing.value
                ? Container(
                    height: 3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  )
                : SizedBox.shrink()),

            // Notifications content
            Expanded(
              child: Obx(() {
                final notifications = controller.filteredNotifications;

                // Jika tidak ada notifikasi, tampilkan pesan kosong
                if (notifications.isEmpty && !controller.isRefreshing.value) {
                  return _buildEmptyState();
                }

                // Jika sedang refresh dan tidak ada data, tampilkan loading
                if (controller.isRefreshing.value && notifications.isEmpty) {
                  return _buildLoadingState();
                }

                return RefreshIndicator(
                  onRefresh: () => controller.refreshNotifications(),
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category header - "Terbaru"
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                        child: Text(
                          'Terbaru',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // Notifications list
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final notification = notifications[index];
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: _buildNotificationCard(notification),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off,
            size: 80,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16),
          Text(
            'Tidak ada notifikasi terbaru',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Notifikasi akan muncul di sini',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Memuat notifikasi...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: () {
          controller.markAsRead(notification.id);
          // Show detail or navigate to related page
          Get.snackbar(
            notification.title,
            'Membuka detail notifikasi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: notification.color.withOpacity(0.8),
            colorText: Colors.white,
            margin: EdgeInsets.all(10),
            borderRadius: 10,
            duration: Duration(seconds: 1),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      notification.message,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      notification.time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Unread indicator
              if (!notification.isRead)
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(left: 8, top: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}