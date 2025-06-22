class BooksController < ApplicationController
    before_action :set_book, only: %i[show edit update destroy]

    # 一覧表示
    def index
        @books = Book.all.order(read_date: :desc)
    end

    # 詳細表示
    def show
    end

    # 新規登録フォーム
    def new
        @book = Book.new
    end

    # 新規登録処理
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path, notice: "本を登録しました!"
        else
            render :new
        end
    end

    # 編集フォーム
    def edit
    end

    # 更新処理
    def update
        if @book.update(book_params)
            redirect_to book_path(@book), notice: "本を更新しました!"
        else
            render :edit
        end
    end

    # 削除処理
    def destroy
        @book.destroy
        redirect_to books_path, notice: "本を削除しました!"
    end

    private

    # 共通で使用する本の取得
    def set_book
        @book = Book.find(params[:id])
    end

    # ストロングパラメータ
    def book_params
        params.require(:book).permit(:title, :author, :read_date, :rating, :thoughts)
    end
end
