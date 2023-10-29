// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      path: json['path'] as String? ?? "lib",
      styles: json['styles'] == null
          ? null
          : StyleConfig.fromJson(json['styles'] as Map<String, dynamic>),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      widgetbook: json['widgetbook'] as bool? ?? true,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'path': instance.path,
      'widgetbook': instance.widgetbook,
      'styles': instance.styles,
      'components': instance.components,
    };

StyleConfig _$StyleConfigFromJson(Map<String, dynamic> json) => StyleConfig(
      inset: (json['inset'] as num?)?.toDouble() ?? 8.0,
      colors: json['colors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StyleConfigToJson(StyleConfig instance) =>
    <String, dynamic>{
      'inset': instance.inset,
      'colors': instance.colors,
    };
