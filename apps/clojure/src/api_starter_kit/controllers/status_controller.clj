(ns api-starter-kit.controllers.status_controller
  (:require [api-starter-kit.services.db :as db]
            [cheshire.core :refer [generate-string]]))

(defn ping [req] "pong")

(defn list-users [req]
  (generate-string (db/find-user "bschwind")))
