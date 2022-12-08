module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_member

    def connect
      self.current_member = find_verified_member
    end

    protected

    # wardenを使用して、ユーザー情報を取得する
    #   情報が見つからなかった場合、例外として処理される
    #   例外処理で未ログインとして処理
    def find_verified_member
      User.find_by(id: env['warden'].member.id)
    rescue
      reject_unauthorized_connection
    end
  end
end
