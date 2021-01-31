require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'nickname,email、password,password_confirmation,firstname,lastname,firstname_reading,lastname_reading,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'test12'
      @user.password_confirmation = 'test12'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが半角英数字混合であれば登録できること' do
      @user.password = 'test123'
      @user.password_confirmation = 'test123'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'passwordが半角英字のみであれば登録できないこと' do
      @user.password = 'testtest'
      @user.password_confirmation = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password includes both letters and numbers.')
    end

    it 'passwordが半角数字のみであれば登録できないこと' do
      @user.password = '12345678'
      @user.password_confirmation = '12345678'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password includes both letters and numbers.')
    end

    it 'firstnameが空では登録できないこと' do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'firstnameが半角では登録できないこと' do
      @user.firstname = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters.')
    end

    it 'lastnameが空では登録できないこと' do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it 'lastnameが半角では登録できないこと' do
      @user.lastname = 'test2'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname is invalid. Input full-width characters.')
    end

    it 'firstname_readingが空では登録できないこと' do
      @user.firstname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname reading can't be blank")
    end

    it 'firstname_readingがカタカナ以外では登録できないこと' do
      @user.firstname_reading = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname reading is invalid. Input full-width kana characters.')
    end

    it 'lastname_readingが空では登録できないこと' do
      @user.lastname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname reading can't be blank")
    end

    it 'lastname_readingがカタカナ以外では登録できないこと' do
      @user.lastname_reading = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname reading is invalid. Input full-width kana characters.')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
