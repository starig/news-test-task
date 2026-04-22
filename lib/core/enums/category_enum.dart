import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum CategoryEnum {
  @JsonValue("business")
  business,
  @JsonValue("entertainment")
  entertainment,
  @JsonValue("general")
  general,
  @JsonValue("health")
  health,
  @JsonValue("science")
  science,
  @JsonValue("sports")
  sports,
  @JsonValue("technology")
  technology,
}
