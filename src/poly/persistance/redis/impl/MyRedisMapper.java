//package poly.persistance.redis.impl;
//
//import org.apache.log4j.Logger;
//
//import poly.persistance.redis.IMyRedisMapper;
//
//@Component("MyRedisMapper")
//public class MyRedisMapper implements IMyRedisMapper {
//
//	@Autowired
//	public RedisTemplate<String, Object> redisDB;
//
//	private Logger log = Logger.getLogger(this.getClass());
//
//	@Override
//	public void doSaveData() throws Exception {
//
//		// 로그찍기(이 함수에 접근했는지 파악하기 용이)
//		log.info(this.getClass().getName() + ".getCacheData service start!");
//
//		String redisKey = "Test01";
//		String saveData = "난 저장되는 데티터이다";
//
//		// redis 저장 및 읽기에 대한 데이터 타입 지정
//		// String 타입으로 지정
//		redisDB.setKeySerializer(new StringRedisSerializer());
//		redisDB.setValueSerializer(new StringRedisSerializer());
//
////		2 데이터가 존재하면 바로 변환
//
//		if (redisDB.hasKey(redisKey)) {
//			String res = (String) redisDB.opsForValue().get(redisKey);
//
//			log.info("res : " + res);
//		} else {
//			redisDB.opsForValue().set(redisKey, saveData);
//
//			log.info("No Data!!");
//		}
//	}
//
//}
