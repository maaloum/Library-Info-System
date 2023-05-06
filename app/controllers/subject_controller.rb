class SubjectController < ApplicationController
    def index 
        @subjects = current_user.subjects.all
    end
    def show
    end

    def show_subjects
        @subject = current_user.subjects.find(params[:id])
        @books = @subject.books
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = current_user.subjects.create(subject_params)
        if @subject.save
            redirect_to subject_index_path, notice: 'Your Subject is created successfully 💯'
        else
            render 'new'
        end
    end

    def destroy
        Subject.find(params[:id]).destroy
        redirect_to subject_index_path
    end

    private
    def subject_params
        params.require(:subject).permit(:title)
    end
end
