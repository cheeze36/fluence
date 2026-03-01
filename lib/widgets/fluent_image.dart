import 'dart:io';
import 'package:flutter/material.dart';
import '../fluent_base.dart';

enum _FluentImageSourceType { asset, network, file, memory }

/// A wrapper for the Image widget that supports asset, network, file, and memory sources.
class FluentImage extends FluentWidget {
  _FluentImageSourceType _sourceType = _FluentImageSourceType.asset;
  String? _assetName;
  String? _url;
  File? _file;
  dynamic _bytes;

  double? _width;
  double? _height;
  BoxFit? _fit;
  Color? _color;
  BlendMode? _colorBlendMode;
  AlignmentGeometry _alignment = Alignment.center;
  ImageRepeat _repeat = ImageRepeat.noRepeat;

  FluentImage.asset(String name)
      : _sourceType = _FluentImageSourceType.asset,
        _assetName = name;

  FluentImage.network(String url)
      : _sourceType = _FluentImageSourceType.network,
        _url = url;

  FluentImage.file(File file)
      : _sourceType = _FluentImageSourceType.file,
        _file = file;

  FluentImage.memory(dynamic bytes)
      : _sourceType = _FluentImageSourceType.memory,
        _bytes = bytes;

  // Empty constructor, defaults to an empty asset or similar, better to use named constructors.
  FluentImage() : _sourceType = _FluentImageSourceType.asset;

  FluentImage setAsset(String name) {
    _sourceType = _FluentImageSourceType.asset;
    _assetName = name;
    notifyListeners();
    return this;
  }

  FluentImage setNetwork(String url) {
    _sourceType = _FluentImageSourceType.network;
    _url = url;
    notifyListeners();
    return this;
  }

  FluentImage setFile(File file) {
    _sourceType = _FluentImageSourceType.file;
    _file = file;
    notifyListeners();
    return this;
  }

  FluentImage setWidth(double? width) {
    _width = width;
    notifyListeners();
    return this;
  }

  FluentImage setHeight(double? height) {
    _height = height;
    notifyListeners();
    return this;
  }

  FluentImage setFit(BoxFit? fit) {
    _fit = fit;
    notifyListeners();
    return this;
  }

  FluentImage setColor(Color? color, {BlendMode? blendMode}) {
    _color = color;
    _colorBlendMode = blendMode;
    notifyListeners();
    return this;
  }

  FluentImage setAlignment(AlignmentGeometry alignment) {
    _alignment = alignment;
    notifyListeners();
    return this;
  }

  @override
  Widget buildWidget(BuildContext context) {
    switch (_sourceType) {
      case _FluentImageSourceType.asset:
        if (_assetName == null) return const SizedBox.shrink();
        return Image.asset(
          _assetName!,
          width: _width,
          height: _height,
          fit: _fit,
          color: _color,
          colorBlendMode: _colorBlendMode,
          alignment: _alignment,
          repeat: _repeat,
        );
      case _FluentImageSourceType.network:
        if (_url == null) return const SizedBox.shrink();
        return Image.network(
          _url!,
          width: _width,
          height: _height,
          fit: _fit,
          color: _color,
          colorBlendMode: _colorBlendMode,
          alignment: _alignment,
          repeat: _repeat,
        );
      case _FluentImageSourceType.file:
        if (_file == null) return const SizedBox.shrink();
        return Image.file(
          _file!,
          width: _width,
          height: _height,
          fit: _fit,
          color: _color,
          colorBlendMode: _colorBlendMode,
          alignment: _alignment,
          repeat: _repeat,
        );
      case _FluentImageSourceType.memory:
        if (_bytes == null) return const SizedBox.shrink();
        return Image.memory(
          _bytes!,
          width: _width,
          height: _height,
          fit: _fit,
          color: _color,
          colorBlendMode: _colorBlendMode,
          alignment: _alignment,
          repeat: _repeat,
        );
    }
  }
}
