resource "aws_dynamodb_table" "widgets-dynamodb-table" {
  name           = "WidgetsTerraform"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ModelNumber"
  range_key      = "SerialNumber"

  attribute {
    name = "ModelNumber"
    type = "S"
  }

  attribute {
    name = "SerialNumber"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }


  tags = {
    name        = "widgets"
    source      = "terraform"
  }
} 