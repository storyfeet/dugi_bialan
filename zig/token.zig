const std = @import("std");

pub const TokenType = enum{
	WORD,
	COMMA,
	STOP,
	QUOTE,
	COMMENT,
	DASH,
};

pub const specialChars = &[7]u21{'\n','\r',' ','\t',',','.','#'};

pub fn special(c:u21)bool{
	for (specialChars) |s| {
		if (c == s) {
			return true;
		}
	}
	return false;
}

pub const Token = struct{
	kind : TokenType,
	start : usize,
	end : usize,
	line : usize,
};


pub const Tokenizer = struct{
	it : std.unicode.Utf8Iterator,
	start : usize,
	line : usize,

	pub fn init(s: []const u8) @This() {
		return @This() {
			.it = std.unicode.Utf8Iterator{.bytes=s,.i=0},
			.start = 0,
			.line = 1,
		};
	}

	pub fn nextToken(self:*@This()) !?Token {
		self.skipWhiteSpace();
		self.start = self.it.i;
		var c = self.it.nextCodepoint() orelse return null;
		switch (c) {
			',' => return self.makeToken(TokenType.COMMA),
			'.' => return self.makeToken(TokenType.STOP),
			'-' => return self.makeToken(TokenType.DASH),
			'"' => return self.makeToken(TokenType.QUOTE),
			'#' => return self.comment(),
			else => return self.word(),
		}
	}

	pub fn comment(self:*@This()) Token{
		self.start = self.it.i;
		while(true){
			var c = self.it.nextCodepoint() 
				orelse return self.makeToken(TokenType.COMMENT);
			switch(c) {
				'\n' => {
					var tk = self.makeToken(TokenType.COMMENT);
					self.line += 1;
					return tk;
				},
				'#' => {
					return Token {
						.kind = TokenType.COMMENT,
						.start = self.start,
						.end = self.it.i - 1,
						.line = self.line,
					};
				},
				else => { }
			}
		}
	}

	pub fn word(self: *@This()) Token {
		while(true){
			const pk = self.it.peek(1);
			if (pk.len == 0) return self.makeToken(TokenType.WORD);
			const cp = std.unicode.utf8Decode(pk) 
				catch return self.makeToken(TokenType.WORD);
			if (special(cp)) {
				return self.makeToken(TokenType.WORD);
			}
			_ = self.it.nextCodepoint();
				
		}
	}

	pub fn makeToken(self:*@This(),tt:TokenType) Token{
		return Token {
			.kind = tt,
			.start = self.start,
			.end = self.it.i,
			.line = self.line,
		};
	}

	pub fn skipWhiteSpace(self:*@This()) void {
		while(true){
			const c = self.it.peek(1);
			if (c.len == 0) return;
			const cp = std.unicode.utf8Decode(c) catch return;
			switch (cp) {
				' ', '\t', '\r' => _ = self.it.nextCodepoint(),
				'\n' => {
					self.line += 1;
					_ = self.it.nextCodepoint();
				},
				else => return,
			}
		}
	}
};


const TErr = error {
	IsNull,
};

test "can compile anything"{
	const ex = std.testing.expect;
	const s = ",Hello, people";
	var tk = Tokenizer.init(s);
	const cm = try tk.nextToken() orelse return error.IsNull;
		
	try std.testing.expect(cm.kind == TokenType.COMMA);
	const hel = try tk.nextToken() orelse return error.IsNull;
	try ex(hel.kind == TokenType.WORD);
	try ex(std.mem.eql(u8,s[hel.start..hel.end] ,"Hello"));
}
