(ns api-starter-kit.services.db
  (:require [hikari-cp.core :as hikari]
            [clojure.java.jdbc :as jdbc]
            [cheshire.core :refer [generate-string]]
            [hugsql.core :as hugsql]))

(def db-host (System/getenv "DB_HOST"))
(def db-name (System/getenv "DB_NAME"))
(def db-port (System/getenv "DB_PORT"))
(def db-username (System/getenv "DB_USERNAME"))
(def db-password (System/getenv "DB_PASSWORD"))

(def datasource-options {:auto-commit        true
                         :read-only          false
                         :connection-timeout 30000
                         :validation-timeout 5000
                         :idle-timeout       600000
                         :max-lifetime       1800000
                         :minimum-idle       10
                         :maximum-pool-size  20
                         :pool-name          "db-pool"
                         :adapter            "postgresql"
                         :username           db-username
                         :password           db-password
                         :database-name      db-name
                         :server-name        db-host
                         :port-number        db-port
                         :register-mbeans    false})

; Queries
(hugsql/def-db-fns "api_starter_kit/sql/auth.sql")

; defonce, otherwise you'll eventually run out of connections
; as reloading this source file will grab another 10 connections
(defonce datasource
  (hikari/make-datasource datasource-options))

(defn list-usernames []
  (jdbc/with-db-connection [conn {:datasource datasource}]
      (let [rows (jdbc/query conn "SELECT * FROM users")]
        (->> rows
             (sort-by :updated_at <)
             (map :username)
             generate-string))))

(defn find-user [username]
  (jdbc/with-db-connection [conn {:datasource datasource}]
      (find-user-by-username conn {:username username})))
