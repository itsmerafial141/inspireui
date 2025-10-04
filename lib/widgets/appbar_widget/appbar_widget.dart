import 'package:flutter/material.dart';

class AppbarWidget extends AppBar {
  AppbarWidget.normal(
    BuildContext context, {
    super.key,
    String? title,
  }) : super(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.secondary,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            title ?? ' ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  // showMessage();
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );

  AppbarWidget.story(
    BuildContext context, {
    super.key,
    String? title,
    Function? onSave,
    Widget? icon,
    Function? onDelete,
    Function? onClose,
  }) : super(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
            icon: icon ??
                Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 24,
                ),
            onPressed: () {
              onClose?.call();
              Navigator.pop(context);
            },
          ),
          title: Text(
            title ?? ' ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          actions: <Widget>[
            if (onSave != null)
              TextButton(
                onPressed: () {
                  onSave();
                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColor),
                ),
              ),
            if (onDelete != null)
              IconButton(
                onPressed: onDelete as void Function()?,
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            const SizedBox(width: 20)
          ],
        );
}
