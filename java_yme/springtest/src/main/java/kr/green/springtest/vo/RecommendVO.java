package kr.green.springtest.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RecommendVO {
	private int num;
	private String id;
	private int board;
	private int state;
}
