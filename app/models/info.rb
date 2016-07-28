class Info < ApplicationRecord
	belongs_to :nanny
	PROFESSIONAL = [:取得保母人員技術士證, "高級中等以上學校幼兒保育、家政、護理相關學程、科、系、所畢業","修畢托育人員（保母）專業訓練課程且領有結業證書"]
end
