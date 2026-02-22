import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final status = controller.status;
        final progress = controller.progress;
        final resource = controller.ressource;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resource.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      if (status != DownloadStatus.notDownloaded)
                        Text(
                          "${(progress * 100).toStringAsFixed(1)} % completed "
                          "- ${(resource.size * progress).toStringAsFixed(1)} "
                          "of ${resource.size} MB",
                          style: TextStyle(fontSize: 14),
                        ),
                    ],
                  ),
                ),
                _buildIconsStatus(status),
              ],
            ),
          ),
        );
      },
    );

    // TODO
  }

  Widget _buildIconsStatus(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return IconButton(
          icon: Icon(Icons.download),
          onPressed: controller.startDownload,
        );

      case DownloadStatus.downloading:
        return Icon(Icons.autorenew);

      case DownloadStatus.downloaded:
        return Icon(Icons.folder);
    }
  }
}
