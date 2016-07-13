class Profile < ApplicationRecord

	mount_uploader :image, ImageUploader

	GENDER = [:FEMAN,:MAN]
	CITY = [:台北市]
	DISTRICT = [:松山區,:信義區,:大安區,:中山區,:中正區,:大同區,:內湖區,:士林區,:北投區,:萬華區,:文山區,:南港區]



end




