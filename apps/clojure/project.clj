(defproject api-starter-kit "0.1.0-SNAPSHOT"
  :description "API Starter Kit"
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [org.clojure/java.jdbc "0.4.2"]
                 [org.postgresql/postgresql "9.4.1212"]
                 [org.slf4j/slf4j-nop "1.7.13"]
                 [hikari-cp "1.7.5"]
                 [http-kit "2.2.0"]
                 [cheshire "5.6.3"]
                 [compojure "1.5.1"]
                 [javax.servlet/servlet-api "2.5"]
                 [ring/ring-devel "1.5.0"]
                 [ring/ring-core "1.5.0"]]
  :main ^:skip-aot api-starter-kit.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
