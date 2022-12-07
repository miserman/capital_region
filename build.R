library(community)

entity_info = jsonlite::read_json("../capital_region/docs/data/entity_info.json")
entity_info$zip_code <- lapply(entity_info$zip_code, function(l) {l$county = "51059"; l})
jsonlite::write_json(entity_info, "../capital_region/docs/data/entity_info.json", auto_unbox = TRUE)

data_add(
  c(
    county = "county.csv.xz",
    tract = "tract.csv.xz",
    block_group = "block_group.csv.xz",
    neighborhood = "neighborhood.csv.xz",
    "human_services_region" = "human_services_region.csv.xz",
    "planning_district" = "planning_district.csv.xz",
    "supervisor_district" = "supervisor_district.csv.xz",
    "zip_code" = "zip_code.csv.xz"
  ),
  rep(list(list(
    ids = list(
      variable = "ID",
      map = "https://raw.githubusercontent.com/uva-bi-sdad/capital_region/main/docs/data/entity_info.json"
    ),
    time = "time",
    variables = "measure_info.json"
  )), 8),
  dir = "../capital_region/docs/data",
  clean = TRUE,
  refresh = TRUE
)

site_build(
  "../capital_region", serve = TRUE,
  endpoint = "https://ncr-data-commons.netlify.app/api"
)
