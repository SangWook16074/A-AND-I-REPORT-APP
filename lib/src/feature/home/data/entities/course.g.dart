// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Course _$CourseFromJson(Map<String, dynamic> json) => _Course(
      id: json['id'] as String,
      slug: json['slug'] as String,
      fieldTag: json['fieldTag'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      metadata:
          CourseMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      phase: json['phase'] as String?,
      targetTrack: json['targetTrack'] as String?,
    );

Map<String, dynamic> _$CourseToJson(_Course instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'fieldTag': instance.fieldTag,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'metadata': instance.metadata,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'phase': instance.phase,
      'targetTrack': instance.targetTrack,
    };

_CourseMetadata _$CourseMetadataFromJson(Map<String, dynamic> json) =>
    _CourseMetadata(
      title: json['title'] as String,
      description: json['description'] as String,
      phase: json['phase'] as String,
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CourseMetadataToJson(_CourseMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'phase': instance.phase,
      'attributes': instance.attributes,
    };
