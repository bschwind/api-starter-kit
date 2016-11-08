(ns api-starter-kit.controllers.status_controller
  (:require [api-starter-kit.services.db :as db]))

(defn ping [req] "pong")

(defn list-users [req] (db/list-usernames))
