use std::env;

#[derive(Debug, Clone)]
pub struct Config {
    pub database_url: String,
    pub frontend_url: String,
    pub bind_address: std::net::IpAddr,
    pub port: u16,
    pub jwt_secret: String,
    pub jwt_ttl_minutes: i64,
    pub refresh_token_days: i64,
    pub is_prod: bool,
}

impl Config {
    pub fn from_env() -> Self {
        let database_url = env::var("DATABASE_URL").expect("DATABASE_URL must be set");

        let frontend_url = env::var("FRONTEND_URL").expect("FRONTEND_URL must be set");

        let bind_address = env::var("BIND_ADDRESS")
            .unwrap_or_else(|_| "127.0.0.1".to_string())
            .parse::<std::net::IpAddr>()
            .expect("BIND_ADDRESS must be a valid IP address");

        let port = env::var("API_PORT")
            .unwrap_or_else(|_| "8080".to_string())
            .parse::<u16>()
            .expect("API_PORT must be a valid port number");

        let jwt_secret = env::var("JWT_SECRET").expect("JWT_SECRET must be set");

        let jwt_ttl_minutes = env::var("JWT_TTL_MINUTES")
            .unwrap_or_else(|_| "15".to_string())
            .parse::<i64>()
            .expect("JWT_TTL_MINUTES must be a valid integer");

        let refresh_token_days = env::var("REFRESH_TOKEN_DAYS")
            .unwrap_or_else(|_| "30".to_string())
            .parse::<i64>()
            .expect("REFRESH_TOKEN_DAYS must be a valid integer");

        let is_prod = env::var("APP_ENV")
            .unwrap_or_else(|_| "development".to_string())
            .eq_ignore_ascii_case("production");

        Self {
            database_url,
            frontend_url,
            bind_address,
            port,
            jwt_secret,
            jwt_ttl_minutes,
            refresh_token_days,
            is_prod,
        }
    }
}
