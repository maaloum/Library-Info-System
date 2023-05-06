class BookController < ApplicationController
    def list
        @user = current_user
        @books = @user.books
    end
    
    def show
        @user = current_user
        @book = Book.find(params[:id])
        @subject = @book.subject
    end
    
    def new
        @user = current_user
        @book = Book.new
        @subjects = current_user.subjects.all
    end
    
    def create
        @user = current_user
        @book = @user.books.create(book_params)
        if @book.save
            redirect_to book_list_path, notice: 'Your Book is created successfully 💯'
        else
            @subjects = Subject.all
            render 'new'       
        end
    end
    
    def edit
        @book = Book.find(params[:id])
        @subjects = current_user.subjects.all
    end
    
    def update
        @book = Book.find(params[:id])
	
        if @book.update(book_params)
           redirect_to :action => 'show', :id => @book
        else
           @subjects = current_user.subjects.all
           render :action => 'edit'
        end
    end
    
    def destroy
        Book.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def show_subjects
        @subject = Subject.find(params[:id])
        @books = @subject.books
     end

    private 
    def book_params
        params.require(:book).permit(:title, :body, :subject_id)
    end
end
