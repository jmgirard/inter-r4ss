haven::read_dta("https://stats.idre.ucla.edu/stat/examples/imm/imm10.dta") |> 
  dplyr::select(
    student = stuid, 
    math, 
    homework, 
    sex, 
    school = schid, 
    public, 
    ratio
  ) |> 
  dplyr::mutate(
    sex = factor(sex, levels = 1:2, labels = c("male", "female")),
    public = factor(public, levels = 0:1, labels = c("non-public", "public")),
    school = stringr::str_c("s", school)
  ) |> 
  readr::write_csv("mlmath.csv")
