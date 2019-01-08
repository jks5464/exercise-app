FactoryBot.define do
    factory :user do
        uid {'1234'}
        provider {'google_oauth2'}
        name {'Zac Steer'}
        oauth_token { 'ya29.GlyKBpm5rEKvpktyjaYhqyEm0kcp9OFjNyP1s5bmgo9Ma6uL9g_OblkYm5nhhZD1Wqlmb-nvzaZgS3lCFbr2GTh5l1G0slN3Ptsr3Fom8SBCUpoEuNWTzqvRCYzsEQ' }
        oauth_expires_at { '2019-01-07 15:53:44' }
    end
end