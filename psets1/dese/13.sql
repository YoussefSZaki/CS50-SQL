SELECT "name", "dropped", "per_pupil_expenditure" FROM "schools"
JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
JOIN "expenditures" ON "expenditures"."district_id" = "schools"."district_id"
ORDER BY "per_pupil_expenditure" ASC, "dropped" DESC;
