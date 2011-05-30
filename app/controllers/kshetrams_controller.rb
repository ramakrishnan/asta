class KshetramsController < ApplicationController
	def index
			@kshetrams = Kshetram.all
	end
	
	def new
		@kshetram = Kshetram.new
	end
	
	def create
		@kshetram = Kshetram.new(params[:kshetram])
		@kshetram.save
		redirect_to kshetrams_path
	end
	
	def edit
		@kshetram = Kshetram.find(params[:id])
	end
	
	def update
		@kshetram = Kshetram.find(params[:id])
		@kshetram.update_attributes(params[:kshetram])
		@kshetram.save
		redirect_to kshetrams_path
	end

end
