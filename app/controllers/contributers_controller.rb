class ContributersController < ApplicationController
	def index
		@contributers = Contributer.find(:all ,
				:select => "contributers.* , k1.name as to_kshetram , k1.place as to_kshetram_place , " +
							" k2.name as my_kshetram , k2.place as my_kshetram_place" ,
				:joins => " inner join kshetrams k1 on k1.id = contributers.kshetram " +
						  " inner join kshetrams k2 on k2.id = contributers.adhimana_kshetram " )
	end
	def new
		@contributer = Contributer.new
		@kshetram_collection = list_all_kshetrams
	end
	
	def create
		@contributer = Contributer.new(params[:contributer])
		@contributer.kshetram = params[:kshetram]
		@contributer.adhimana_kshetram = params[:adhimana_kshetram]		
		@contributer.save
		redirect_to contributers_path
	end
	
	def edit
		@contributer = Contributer.find(params[:id])
		@kshetram_collection = list_all_kshetrams
	end
	
	def update
		@contributer = Contributer.find(params[:id])
		@contributer.update_attributes(params[:contributer])
		@contributer.kshetram = params[:kshetram]
		@contributer.adhimana_kshetram = params[:adhimana_kshetram]
		@contributer.save
		redirect_to contributers_path
	end
	
	:protected
	def	list_all_kshetrams
		 select_options = Array.new
		 kshetrams = Kshetram.all
		 for kshetram in kshetrams
			select_options << ["#{kshetram.name} -- #{kshetram.place}" , kshetram.id]
		 end
		 return select_options
	end
end
