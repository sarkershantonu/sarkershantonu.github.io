how to generate unitque ID for each iteration in each thread group 

JSR sample 

char[] chars = "0123456789".toCharArray();
Random rnd = new Random();
StringBuilder sb = new StringBuilder((100000 + rnd.nextInt(900000)));
for (int i = 0; i < 7; i++)
    sb.append(chars[rnd.nextInt(chars.length)]);


vars.put("email","shantonu_"+UUID.randomUUID().toString()+"+"+sb.toString()+"@gmail.com");
vars.put("spinID","ss"+sb.toString());