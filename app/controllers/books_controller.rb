class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.get(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    amount = params[:book][:amount]
    date = Time.now()
    name = params[:book][:name]
    description = params[:book][:description]
    @book.attributes = {:amount => amount, :date => date, :name => name, :description => description}

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete
  end

end
