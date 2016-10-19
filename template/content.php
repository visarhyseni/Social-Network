<!--Content area starts-->
		<div id="content">
			<div>
				<img src="images/image.png" style="float:left; margin-left:-40px;"/>
			</div>
			<div id="form2">
				<form action="" method="post">
					<table> 
						<tr>
							<td align="right">Emri:</td>
							<td>
							<input type="text" name="u_name" placeholder="T&euml jepet Emri" required="required"/>
							</td>
						</tr>
						
						<tr>
							<td align="right">Fjal&eumlkalimi:</td>
							<td>
							<input type="password" name="u_pass" placeholder="T&euml jepet Fjalekalimi" required="required"/>
							</td>
						</tr>
						
						<tr>
							<td align="right">E-mail:</td>
							<td>
							<input type="email" name="u_email" placeholder="T&euml jepet E-mail" required="required"></td   >
						</tr>
						
						<tr>
							<td align="right">Shteti:</td>
							<td>
							<select name="u_country" required="required">
								<option>Zgjedh Shtetin</option>
								<option>Shqiperi</option>
								<option>Kosove</option>
								<option>Maqedoni</option>
								<option>Gjermani</option>
								<option>SH.B.A</option>
							</select>
							</td>
						</tr>
						
						<tr>
							<td align="right" required="required">Gender:</td>
							<td>
							<select name="u_gender">
								<option>Zgjedhni gjinin&euml</option>
								<option>Mashkull</option>
								<option>Femer</option>
								
							</select>
							</td>
						</tr>
						
						<tr>
							<td align="right">Dit&eumllindja:</td>
							<td>
							<input type="date" name="u_birthday"/>
							</td>
						</tr>
						
						<tr>
							<td colspan="6">
							<button name="sign_up">Regjistrohu</button>
							</td>
						</tr>
					</table>
				</form>
				<?php 
				include("user_insert.php");
				?>
			</div>
		</div>
		<!--Content area ends-->